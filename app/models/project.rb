class Project < ApplicationRecord
  # has_and_belongs_to_many :users, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  
  has_many :bugs, dependent: :destroy
  has_many :features, dependent: :destroy

  # after_commit :add_project_manager

  
def add_project_manager
  # users.push(current_user)
	# puts(Project.last.users)
end

  # validates :name, presence: true
end
