class ExtensaoRealizada < ApplicationRecord
  belongs_to :extensao, foreign_key: :extensao_id
  belongs_to :estudante, polymorphic: true
  belongs_to :coordenador, polymorphic: true, optional: true

  before_save :regulaCargaHoraria

  private

  def regulaCargaHoraria
    self.chHoraria = extensao.chMax if chHoraria > extensao.chMax
  end
  
end
