class Extensao < ApplicationRecord
  # A Extensao pertence a uma atividade
  belongs_to :atividade
  # Uma Extensao possui várias ExtensaoRealizada
  has_many :extensao_realizadas

  # Validação para os campos não ficarem em branco
  validates :nome, :descricao, :chMax, presence: { message: 'não pode estar em branco' }

  # Antes de salvar regula a carga horária
  before_save :regulaCargaHoraria

  private

  # Regula a carga horária máxima, em caso do usuário fornecer uma maior que a máxima.
  def regulaCargaHoraria
    self.chMax = atividade.chPossivel if chMax > atividade.chPossivel
  end
end
