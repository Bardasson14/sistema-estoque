class RemoveUsuarioIdFromMovimentacoes < ActiveRecord::Migration[6.0]
  def change
    remove_column :movimentacoes, :usuario_id
  end
end
