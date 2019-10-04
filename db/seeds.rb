# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find(1)

20.times do |i| 
  random_id = rand(100)
  image_url = "https://picsum.photos/id/#{random_id}/400/200"
  user.posts.create!(content: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Recusandae doloribus sit obcaecati nam nihil beatae, optio qui soluta aliquam maxime, debitis suscipit illo animi fugit aspernatur fuga veritatis eum sunt. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo ea voluptas obcaecati officiis distinctio tempore, officia doloremque, molestias et maiores recusandae expedita. Sint voluptatem nemo sequi et accusamus. Maxime, architecto.", image_link: image_url)
end

posts = Post.all

posts.each do |post|
  5.times do |i|
    post.comments.create!(content: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Iusto nobis in totam ad animi maiores fuga accusamus quas perferendis voluptas quod, ex aperiam, nisi qui officiis. Eveniet modi ut est!", user_id: user.id)
  end
end