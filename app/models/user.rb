
class User < ApplicationRecord
  # has_and_belongs_to_many :projects, 
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects

  has_many :bugs, dependent: :nullify
  
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
