class AddCoordenadorIdToExtensaoRealizadas < ActiveRecord::Migration[7.0]
  def change
    add_reference :extensao_realizadas, :coordenador, polymorphic: true, null: true
  end
end
