class Bug < ApplicationRecord
  belongs_to :project
  enum status: [:started, :in_progress, :in_review, :fixed]
end
