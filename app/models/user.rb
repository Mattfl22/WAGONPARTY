class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  USER_TYPE = [["I have a wagon to rent", "Provider"], ["I'm looking for a wagon to partayyy", "Client"]]
  validates :first_name, :last_name, :user_type, presence: true
  # check enum attribute
end
