class User < ApplicationRecord

  validates :name,presence:true
  validates :surname,presence:true
  validates :email,presence:true
  validates :birthday,presence:true
  validates :tel, presence:true
  validates :position,presence:true

  has_one :pme
  has_many :discussions, dependent: :type
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.search(email)
      if email
          where('email = ?',email).first
      end
  
  end

end
