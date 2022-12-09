# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Seeding development database...'
chichi = User.first_or_create!(email: 'chichi@imc.com',
                              password: 'password',
                              password_confirmation: 'password',
                              first_name: 'Chi',
                              last_name: 'Chi',
                              role: User.roles[:admin])

jane = User.first_or_create!(email: 'jane@imc.com',
                             password: 'password',
                             password_confirmation: 'password',
                             first_name: 'Jane',
                             last_name: 'Doe')
Address.first_or_create!(street: '123 Main St',
                         city: 'New York',
                         state: 'NY',
                         zip: 10001,
                         country: 'USA',
                         user: chichi)
Address.first_or_create!(street: '123 Main St',
                         city: 'New York',
                         state: 'NY',
                         zip: 10001,
                         country: 'USA',
                         user: jane)

elapsed = Benchmark.measure do
  posts = []
  10.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Title #{x}",
                    body: "Body #{x} we got some words over here",
                    user: chichi)
  5.times do |y|
    puts "Creating comment #{y} for post #{x}"
    post.comments.build(body: "Comment #{y}",
                        user: jane)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end
puts "Seeded development DB in #{elapsed.real} seconds"