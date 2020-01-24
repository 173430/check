class User < ApplicationRecord

    has_many :notegoods
    
    belongs_to :classroom
   
end
