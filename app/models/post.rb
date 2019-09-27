class Post < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
end
