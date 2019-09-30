# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }
  validates_presence_of :content
  belongs_to :user
end
