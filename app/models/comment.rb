# frozen_string_literal: true

class Comment < ApplicationRecord
  validates_presence_of :content

  belongs_to :user
  belongs_to :post
end
