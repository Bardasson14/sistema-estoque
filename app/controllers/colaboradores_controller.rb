class ColaboradoresController < ApplicationController
    before_action :authenticate_usuario!

    def create
        authorize! :manage, Usuario
        @colaborador = Usuario.new(colaborador_params[:usuario])
        
        if @colaborador.save
            redirect_to usuarios_path
        else
            flash[:alert] = "Erro ao criar o colaborador. Revise as informações e tente novamente!"
            flash[:errors] = @colaborador.errors.full_messages&.join(', ') 
            redirect_to cadastrar_colaborador_path
        end
    end

    def destroy
        authorize! :manage, Usuario
        @colaborador = Usuario.find(colaborador_params[:id])
        
        unless @colaborador.destroy
            flash[:alert] = "Erro ao remover o colaborador. Por favor, tente novamente mais tarde."
        end

        redirect_to usuarios_path
    end

    private
    
    def colaborador_params
        params.permit(:id, :nome, :email, :password, :password_confirmation, :tipo_perfil, :usuario => {})
    end

end