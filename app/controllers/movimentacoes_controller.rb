class MovimentacoesController < ApplicationController
    before_action :authenticate_usuario!
    
    def new
        @produtos = Produto.all&.pluck(:nome).zip Produto.all&.pluck(:id)
    end

    def create
        @movimentacao = Movimentacao.new(movimentacao_params[:movimentacao])
        
        unless @movimentacao.save
            flash[:alert] = "Erro ao registrar a operação. Revise as informações e tente novamente!"
            flash[:errors] = @movimentacao.errors.full_messages&.join(', ') 
            redirect_to new_movimentacao_path
        else
            qtd = @movimentacao.produto.movimentar_estoque(@movimentacao.tipo, @movimentacao.quantidade)
            @movimentacao.produto.update(quantidade_disponivel: qtd)
            redirect_to movimentacoes_path
        end

    end

    def destroy
        @movimentacao = Movimentacao.find(movimentacao_params[:id])
        unless @movimentacao.destroy
            flash[:alert] = "Erro ao remover o movimentacao. Por favor, tente novamente mais tarde."
        end
        redirect_to movimentacoes_path
    end

    def show
        @movimentacao = Movimentacao.find(movimentacao_params[:id])
    end

    def index 
       @movimentacoes = Movimentacao.all
    end

    private

    def movimentacao_params
        params.permit(:id, :movimentacao=>{})
    end

end