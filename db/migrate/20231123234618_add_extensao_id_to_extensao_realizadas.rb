class AddExtensaoIdToExtensaoRealizadas < ActiveRecord::Migration[7.0]
  def change
    add_reference :extensao_realizadas, :extensao, null: false, foreign_key: true
  end
end
