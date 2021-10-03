class UsuariosController < ApplicationController
    before_action :authenticate_usuario!

    def new
        authorize! :manage, Usuario
    end
    
    def index
        authorize! :manage, Usuario
        @colaboradores = Usuario.colaboradores
    end

    def show
        @usuario = Usuario.find(usuario_params[:id])
    end

    private

    def usuario_params
        params.permit(:id)
    end
end