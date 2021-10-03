class Produto < ActiveRecord::Base
    has_many :movimentacoes, :dependent => :delete_all
    
    validates_presence_of :nome
    validates :quantidade_disponivel, presence: true, numericality: { greater_than: 0, message: 'deve haver pelo menos uma unidade disponível' }
    validates :preco_unidade, presence: true, numericality: { greater_than: 0, message: 'preço deve ser maior do que zero' }
    
    accepts_nested_attributes_for :movimentacoes, reject_if: :all_blank, allow_destroy: true

    def movimentar_estoque(tipo, quantidade)
        return (tipo == "entrada") ?  (quantidade_disponivel + quantidade) : (quantidade_disponivel - quantidade) 
    end
end
