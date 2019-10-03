module PagesHelper
  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", class: 'rounded-circle gravatar-size'
  end
  
  def random_image
    random_id = rand(100)
    "https://picsum.photos/id/#{random_id}/400/200"
  end
  
  
end
