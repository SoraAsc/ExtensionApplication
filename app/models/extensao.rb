class Extensao < ApplicationRecord
  belongs_to :atividade
  has_many :extensao_realizadas

  validates :nome, :descricao, :chMax, presence: { message: 'não pode estar em branco' }

  before_save :regulaCargaHoraria

  private

  def regulaCargaHoraria
    self.chMax = atividade.chPossivel if chMax > atividade.chPossivel
  end
end
