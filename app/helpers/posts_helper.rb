# frozen_string_literal: true

module PostsHelper
  def post_exists?(post)
    post.image_link != '' && !post.image_link.nil?
  end
end
