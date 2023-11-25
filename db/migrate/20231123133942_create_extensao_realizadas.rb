class CreateExtensaoRealizadas < ActiveRecord::Migration[7.0]
  def change
    create_table :extensao_realizadas do |t|
      t.date :dataDeSolicitacao
      t.text :descricao
      t.boolean :ativo
      t.float :chHoraria
      t.date :dataDeConfirmacao
      # t.binary :documento

      t.timestamps
    end
  end
end
