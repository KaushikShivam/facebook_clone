# frozen_string_literal: true

class Friendship < ApplicationRecord
  after_create :send_inverse_friendship
  after_update :update_inverse_friendship
  after_destroy :delete_inverse_friendship

  enum status: { pending: 0, requested: 1, accepted: 2 }
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  private

  def send_inverse_friendship
    return if Friendship.exists?(user: friend, friend: user)

    Friendship.create!(user_id: friend_id, friend_id: user_id, status: 1)
  end

  def update_inverse_friendship
    other_friendship = Friendship.find_by(user: friend, friend: user)
    other_friendship.accepted! unless other_friendship.accepted?
  end

  def delete_inverse_friendship
    Friendship.find_by(user: friend, friend: user).destroy if Friendship.exists?(user: friend, friend: user)
  end
end
