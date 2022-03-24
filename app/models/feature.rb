class Feature < ApplicationRecord
  belongs_to :project
  enum status: [:started, :in_progress, :in_review, :completed]
end
