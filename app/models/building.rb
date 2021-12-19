class Building < ApplicationRecord
 #has_many :apartments, dependent: :delete_all 
 has_many :apartments
 has_one_attached :fotito
 validates(:nombre, presence: true, uniqueness: true)
 validates(:direccion, presence: true)
 validates(:ciudad, presence: true)
 validates(:region, presence: true)
end
