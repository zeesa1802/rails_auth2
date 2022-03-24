class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :bugs
  has_many :features
  # validates :name, presence: true
end
