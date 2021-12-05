class Discussion < ApplicationRecord

     belongs_to :user
     has_many :commentaires, dependent: :destroy
     belongs_to :assistant,optional:true
end 
