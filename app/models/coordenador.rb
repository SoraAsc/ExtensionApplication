# Herda tudo de usuário
class Coordenador < Usuario
  # Um coordenador tem várias extensões realizadas.
  has_many :extensao_realizadas

  # Não usada, porém se o sistema, posuisse mais de um coordenador, poderia ser usada, para delimitar a visualização só daquela extensão que determinador coordenador validou.
  def VerExtensoesRealizadas
    extensao_realizadas.select { |extensao_realizada| extensao_realizada.ativo == true }
  end

  def VerTodasExtensoesNaoValidadas
    ExtensaoRealizada.all.select { |extensao_realizada| extensao_realizada.ativo == false || extensao_realizada.ativo.nil? }
  end

  def VerEstudantesNaoFinalizados
    ExtensaoRealizada.all.map(&:estudante).uniq.select { |estudante| estudante.VerificarCargaHoraria()[1] < 365 }
  end

  def VerEstudantesFinalizados
    ExtensaoRealizada.all.map(&:estudante).uniq.select { |estudante| estudante.VerificarCargaHoraria()[1] >= 365 }
  end

  def VerTodasExtensoesValidadas
    ExtensaoRealizada.all.select { |extensao_realizada| extensao_realizada.ativo == true }
  end
end
