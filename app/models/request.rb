class Request < ApplicationRecord
  # belongs_to :user
  enum Status: [:new_request, :accept, :reject]

  validates :Deadline, presence: true
end
