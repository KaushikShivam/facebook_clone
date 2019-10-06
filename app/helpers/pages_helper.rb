# frozen_string_literal: true

module PagesHelper
  def gravatar_helper(user, custom = '')
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}",
              class: "rounded-circle gravatar-size #{custom}"
  end

  def random_image
    random_id = rand(100)
    "https://picsum.photos/id/#{random_id}/400/200"
  end

  def get_three_comments(post)
    post.comments.limit(3)
  end
end
