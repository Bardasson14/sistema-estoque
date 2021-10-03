class Ability
    include CanCan::Ability

    def initialize(usuario)
        if usuario
            if usuario.tipo_perfil == "administrador"
                can :manage, :all
            elsif usuario.tipo_perfil == "colaborador"
                cannot :manage, Usuario
                can :manage, Produto
                can :manage, Movimentacao
            end
        end
    end
end