class Atividade < ApplicationRecord
  belongs_to :modalidade
  has_many :extensaos

  before_save :regulaCargaHoraria

  enum categoria: { curso: 0, dia_de_evento: 1, projeto: 2, semestre: 3, aula: 4, atividade: 5, edicao: 6, sem_restrição: 7 }

  private

  def regulaCargaHoraria
    self.chMax = modalidade.chMax if chMax > modalidade.chMax
    self.chPossivel = chMax if chPossivel > chMax
  end
end
