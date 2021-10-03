class ProdutosController < ApplicationController
    before_action :authenticate_usuario!
    
    def index 
        @produtos = Produto.all
    end

    def show
        @produto = Produto.find(produto_params[:id])
    end

    def new
        @produto = Produto.new
    end

    def create
        @produto = Produto.new(produto_params[:produto])
        unless @produto.save
            flash[:alert] = "Erro ao criar o produto. Revise as informações e tente novamente!"
            flash[:errors] = @produto.errors.full_messages&.join(', ') 
            redirect_to new_produto_path
        else
            movimentacao = Movimentacao.new(produto: @produto, quantidade: @produto.quantidade_disponivel, tipo: :entrada)
            movimentacao.save
            redirect_to produtos_path
        end
    end

    def destroy
        @produto = Produto.find(produto_params[:id])
        unless @produto.destroy
            flash[:alert] = "Erro ao remover o produto. Por favor, tente novamente mais tarde."
        end
        redirect_to produtos_path
    end

    private

    def produto_params
        params.permit(:id, :nome, :descricao, :quantidade_disponivel, :preco_unidade, :produto =>{})
    end
    
end