class ExtensaoRealizada < ApplicationRecord
  # A ExtensaoRealizada possui uma Extensao
  belongs_to :extensao, foreign_key: :extensao_id
  # A ExtensaoRealizada pertence a um Estudante, ("polymorphic: true": indica que a associação é polimórfica, ou seja o estudante pode se associar com vários outros modelos)
  belongs_to :estudante, polymorphic: true
  # A ExtensaoRealizada possui 0 ou um Coordenador que o validou. ("optional: true": Indica que a associação é opcional)
  belongs_to :coordenador, polymorphic: true, optional: true

  # É da biblioteca ActiveStorage, responsável pelo tratamento, conversão e salvamento de arquivos no BD. Uma ExtensaoRealizada tem vários ou nenhum documento.
  has_many_attached :documentos

  # Sempre que uma instância dessa classe for criada, atualizada, salvada esse função será chamada.
  before_save :regulaCargaHoraria

  private

  # Regula a carga horária máxima e possível da atividade, em caso do usuário fornecer uma maior que o esperado.
  def regulaCargaHoraria
    self.chHoraria = extensao.chMax if chHoraria > extensao.chMax
  end
end
