class Extensao < ApplicationRecord
  belongs_to :atividade
  has_many :extensao_realizadas

  validates :nome, :descricao, :chPossivel, :chMax, presence: { message: 'não pode estar em branco' }
  validates :regulaCargaHoraria

  before_save :regulaCargaHoraria

  private

  def regulaCargaHoraria
    self.chMax = atividade.chMax if chMax > atividade.chMax
    self.chPossivel = chMax if chPossivel > chMax
  end
end
