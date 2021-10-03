class ApplicationController < ActionController::Base
    layout "application"
    before_action :configure_permitted_parameters, if: :devise_controller?
    rescue_from CanCan::AccessDenied, with: :falha_autorizacao
    
    def current_user
        current_usuario
    end

    def falha_autorizacao
        redirect_to acesso_negado_path
    end

    def acesso_negado
        render :layout => "permissao_negada"
    end

    protected

    def configure_permitted_parameters
        # permitindo parâmetros adicionais do sign up do DEVISE.
        attributes = [:nome, :tipo_perfil]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    end
end
