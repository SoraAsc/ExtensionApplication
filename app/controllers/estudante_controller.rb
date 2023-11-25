class EstudanteController < ApplicationController
  before_action :authenticate_usuario!
  before_action :autoriza_estudante, only: %i[index submeter_extensao]

  def index
    @extensao_realizadas = ExtensaoRealizada.includes(extensao: { atividade: :modalidade }).where(estudante_id: current_usuario.id).all
    calcular_ch_acumulada
    # @extensoes = Extensao.includes(atividade: :modalidade).all
  end

  def submeter_extensao
    if request.post? # && curent_usuario
      @extensao_realizada = ExtensaoRealizada.new(extensao_realizada_params.merge(estudante: current_usuario, dataDeSolicitacao: Time.current, ativo: false))
      if @extensao_realizada.save
        redirect_to root_path, notice: 'Extensão solicitada com sucesso.'
      else
        render :submeter_extensao
      end
    else
      @extensao_realizada = ExtensaoRealizada.new
    end
  end

  private

  def autoriza_estudante
    redirect_to root_path, alert: 'Você não tem permissão para acessar esta página.' unless current_usuario.estudante?
  end

  def extensao_realizada_params
    params.require(:extensao_realizada).permit(:descricao, :chHoraria, :documento, :extensao_id)
  end

  def calcular_ch_acumulada
    @carga_horaria_total = 0
    @carga_horaria_acumulada = 0
    # Dicionários para armazenar as horas acumuladas por atividade e modalidade
    horas_acumuladas_por_atividade = Hash.new(0)
    horas_acumuladas_por_modalidade = Hash.new(0)

    # Itera através das extensões realizadas
    @extensao_realizadas.each do |extensao_realizada|
      next unless extensao_realizada.ativo

      @carga_horaria_total += extensao_realizada.chHoraria
      carga_disponivel = carga_disponivel_para_extensao(extensao_realizada, horas_acumuladas_por_atividade, horas_acumuladas_por_modalidade)

      @carga_horaria_acumulada += carga_disponivel
      atividade_id = extensao_realizada.extensao.atividade.id
      modalidade_id = extensao_realizada.extensao.atividade.modalidade.id
      horas_acumuladas_por_atividade[atividade_id] += carga_disponivel
      horas_acumuladas_por_modalidade[modalidade_id] += carga_disponivel
    end
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
