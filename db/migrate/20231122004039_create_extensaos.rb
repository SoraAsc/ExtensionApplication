class CreateExtensaos < ActiveRecord::Migration[7.0]
  def change
    create_table :extensaos do |t|
      t.string :nome
      t.text :descricao
      t.float :chPossivel
      t.float :chMax
      t.binary :documento

      t.timestamps
    end
  end
end
