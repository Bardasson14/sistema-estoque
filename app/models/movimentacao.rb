class Movimentacao < ActiveRecord::Base
  belongs_to :produto

  validates_presence_of :tipo
  validates_presence_of :produto
  validates :quantidade, presence: true, numericality: { greater_than: 0, message: 'Movimentação deve envolver no mínimo 1 unidade' }
  validate :movimentacao_nao_supera_limite

  def movimentacao_nao_supera_limite
    if (tipo == "saida") && (quantidade > produto.quantidade_disponivel)
      errors.add(:base, "Saída é maior que o estoque disponível")
    end
  end
end
