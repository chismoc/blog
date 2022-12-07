# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    User.create(email: 'admin@imc.com',
        password: 'password',
        password_confirmation: 'password',
        name: 'Admin',
        role: User.roles[:admin])
    User.create(email: 'jane@imc.com',
        password: 'password',
        password_confirmation: 'password',
        name: 'Jane Doe')
        
     elapsed = Benchmark.measure do
        posts = []
        admin=User.first
        jane = User.second
        1000.times do |x|
        puts "Creating post #{x}"
        post = Post.new(title: "Title #{x}",
                    body: "Body #{x} Words go here Idk",
                    user: admin)
   
        10.times do |y|
        puts "Creating comment #{y} for post #{x}"
        post.comments.build(body: "Comment #{y}",
                user: jane)
         end
         posts.push(post)
        end
        Post.import(posts, recursive: true)
        end
   

    puts "Elapsed time is #{elapsed.real} seconds"