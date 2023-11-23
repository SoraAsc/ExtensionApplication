class Extensao < ApplicationRecord
  belongs_to :atividade

  validates :nome, :descricao, :chPossivel, :chMax, presence: { message: 'não pode estar em branco' }
end
