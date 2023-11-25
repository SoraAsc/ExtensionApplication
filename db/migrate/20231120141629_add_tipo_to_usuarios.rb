class AddTipoToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :type, :string
  end
end
