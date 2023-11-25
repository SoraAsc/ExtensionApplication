class Atividade < ApplicationRecord
  belongs_to :modalidade
  has_many :extensaos

  before_save :regulaCargaHoraria

  private

  def regulaCargaHoraria
    self.chMax = modalidade.chMax if chMax > modalidade.chMax
    self.chPossivel = chMax if chPossivel > chMax
  end
end
