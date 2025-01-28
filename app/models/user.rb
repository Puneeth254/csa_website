class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  def self.find_for_authentication(conditions)
    where(username: conditions[:username]).first
  end
  has_many :sales
end
