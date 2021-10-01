class CreateMovimentacoes < ActiveRecord::Migration[6.0]
  def change
    create_table :movimentacoes do |t|
      t.string :tipo
      t.references :produto, null: false, foreign_key: true
      t.references :usuario, null: false, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
