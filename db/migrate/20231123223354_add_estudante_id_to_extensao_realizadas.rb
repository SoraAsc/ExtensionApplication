class AddEstudanteIdToExtensaoRealizadas < ActiveRecord::Migration[7.0]
  def change
    add_reference :extensao_realizadas, :estudante, polymorphic: true, null: false
  end
end
