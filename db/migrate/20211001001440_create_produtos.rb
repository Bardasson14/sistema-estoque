class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :descricao
      t.string :quantidade_disponivel
      t.decimal :preco_unidade

      t.timestamps
    end
  end
end
