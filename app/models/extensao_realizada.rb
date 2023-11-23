class ExtensaoRealizada < ApplicationRecord
  belongs_to: extensao, foreign_key: :extensao_id
  belongs_to: estudante, foreign_key: :estudante_id
end
