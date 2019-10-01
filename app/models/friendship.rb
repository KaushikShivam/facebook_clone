class Friendship < ApplicationRecord
  after_create :send_inverse_friendship
  after_update :update_inverse_friendship
  after_destroy :delete_inverse_friendship


  enum status: {pending: 0, requested: 1, accepted: 2}
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  
  private
  def send_inverse_friendship
    if !Friendship.exists?(user: self.friend, friend: self.user)
      Friendship.create!(user_id: self.friend_id, friend_id: self.user_id, status: 1)
    end
  end
  
  def update_inverse_friendship
    other_friendship = Friendship.find_by(user: self.friend, friend: self.user)
    if !other_friendship.accepted?
      other_friendship.accepted!
    end
  end

  def delete_inverse_friendship
    if Friendship.exists?(user: self.friend, friend: self.user)
      Friendship.find_by(user: self.friend, friend: self.user).destroy
    end
  end  
end
