class Friendship < ApplicationRecord
  enum status: {pending: 0, requested: 1, accepted: 2}
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end
