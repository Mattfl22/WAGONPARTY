class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  USER_TYPE = ["I have a wagon to rent", "I'm looking for a wagon to partayyy"]
  validates :first_name, :last_name, :user_type, presence: true
  validates :user_type, inclusion: { in: USER_TYPE }
end
