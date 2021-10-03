class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates_presence_of :nome
  validates_presence_of :tipo_perfil
  validates_inclusion_of :tipo_perfil, :in => %w(administrador colaborador)
  
  scope :colaboradores, -> { where(tipo_perfil: :colaborador) }
end
