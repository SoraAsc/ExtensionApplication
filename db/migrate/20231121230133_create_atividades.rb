class CreateAtividades < ActiveRecord::Migration[7.0]
  def change
    create_table :atividades do |t|
      t.string :nome
      t.float :chPossivel
      t.float :chMax

      t.timestamps
    end
  end
end
