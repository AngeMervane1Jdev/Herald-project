class Pme < ApplicationRecord
    validates :designation,presence:true,length:{minimum:5}
    validates :raison,presence:true
    validates :email,presence:true
    validates :address,presence:true
    validates :state,presence:true
    validates :contact,presence:true
    validates :sector,presence:true
    validates :status,presence:true
  
    belongs_to :user
end
