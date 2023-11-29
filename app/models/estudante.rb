# Herda tudo de usuário
class Estudante < Usuario
  # Um Estudante tem várias extensões realizadas.
  has_many :extensao_realizadas

  # Esta sendo usada
  def VerificarCargaHoraria
    calcular_ch_acumulada
  end

  # Esta sendo usada
  def VerExtensoesNaoRealizadas
    extensao_realizadas.select { |extensao_realizada| extensao_realizada.ativo == false || extensao_realizada.ativo.nil? }
  end

  private

  def calcular_ch_acumulada
    carga_horaria_total = 0
    carga_horaria_acumulada = 0
    # Dicionários para armazenar as horas acumuladas por atividade e modalidade
    horas_acumuladas_por_atividade = Hash.new(0)
    horas_acumuladas_por_modalidade = Hash.new(0)

    # Itera através das extensões realizadas
    extensao_realizadas.each do |extensao_realizada|
      next unless extensao_realizada.ativo

      carga_horaria_total += extensao_realizada.chHoraria
      carga_disponivel = carga_disponivel_para_extensao(extensao_realizada, horas_acumuladas_por_atividade, horas_acumuladas_por_modalidade)

      carga_horaria_acumulada += carga_disponivel
      atividade_id = extensao_realizada.extensao.atividade.id
      modalidade_id = extensao_realizada.extensao.atividade.modalidade.id
      horas_acumuladas_por_atividade[atividade_id] += carga_disponivel
      horas_acumuladas_por_modalidade[modalidade_id] += carga_disponivel
    end
    [carga_horaria_total, carga_horaria_acumulada]
  end

  def carga_disponivel_para_extensao(extensao_realizada, horas_acumuladas_por_atividade, horas_acumuladas_por_modalidade)
    atividade_id = extensao_realizada.extensao.atividade.id
    modalidade_id = extensao_realizada.extensao.atividade.modalidade.id

    # Lógica para calcular a carga horária disponível considerando os limites em extensao, atividade e modalidade
    extensao_max = extensao_realizada.extensao.chMax
    atividade_max = extensao_realizada.extensao.atividade.chMax
    modalidade_max = extensao_realizada.extensao.atividade.modalidade.chMax

    # Calcula a carga horária disponível considerando os limites
    carga_disponivel = [extensao_realizada.chHoraria, extensao_max, atividade_max - horas_acumuladas_por_atividade[atividade_id], modalidade_max - horas_acumuladas_por_modalidade[modalidade_id]].min

    # Retorna a carga horária disponível
    [carga_disponivel, 0].max
  end
end
