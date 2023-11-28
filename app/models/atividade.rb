class Atividade < ApplicationRecord
  # A Atividade pertence a uma modalidade
  belongs_to :modalidade
  # A Atividade possui várias extensões
  has_many :extensaos

  # Sempre que uma instância dessa classe for criada, atualizada, salvada esse função será chamada.
  before_save :regulaCargaHoraria

  # Da um sentindo a categoria, que é apenas um campo do tipo inteiro.
  enum categoria: { curso: 0, dia_de_evento: 1, projeto: 2, semestre: 3, aula: 4, atividade: 5, edicao: 6, sem_restrição: 7 }

  private

  # Regula a carga horária máxima e possível da atividade, em caso do usuário fornecer uma maior que o esperado.
  def regulaCargaHoraria
    self.chMax = modalidade.chMax if chMax > modalidade.chMax
    self.chPossivel = chMax if chPossivel > chMax
  end
end
