module ApplicationHelper
    # métodos adicionados p/ poder reaproveitar o form de sign in do devise
    def resource_name
        :usuario
    end

    def resource
        @resource ||= Usuario.new
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:usuario]
    end
end
