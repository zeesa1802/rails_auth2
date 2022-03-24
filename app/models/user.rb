
class User < ApplicationRecord
  # rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  enum role: [:project_manager, :developer, :qa, :admin]
  
  # after_create :assign_default_role

  validates :role, presence: :true
  

  
  # private
  # def assign_default_role
  # self.add_role(:newuser) if self.roles.blank?
  # end

  # def must_have_a_role
  #   unless roles.any?
  #     errors.add(:roles, "must have at least 1 role")
  #   end
  # end

end
