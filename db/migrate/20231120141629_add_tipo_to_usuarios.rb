class AddTipoToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :tipo, :integer, default: 0
  end
end
