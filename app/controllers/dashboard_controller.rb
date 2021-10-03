class DashboardController < ApplicationController
    before_action :authenticate_usuario!
    
    def index 
        @total_produtos_estoque = Produto.sum(:quantidade_disponivel)
        @total_usuarios = Usuario.all.size
        @valor_estoque = Produto.sum("preco_unidade*quantidade_disponivel")
        @entradas = Movimentacao.where(tipo: :entrada).size
        @saidas = Movimentacao.where(tipo: :saida).size
        @movimentacao_mais_recente = Movimentacao.last
    end

end