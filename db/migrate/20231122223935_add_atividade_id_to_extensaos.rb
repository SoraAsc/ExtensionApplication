class AddAtividadeIdToExtensaos < ActiveRecord::Migration[7.0]
  def change
    add_reference :extensaos, :atividade, null: false, foreign_key: true
  end
end
