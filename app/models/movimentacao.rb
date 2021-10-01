class Movimentacao < ActiveRecord::Base
  belongs_to :produto
  belongs_to :usuario
end
