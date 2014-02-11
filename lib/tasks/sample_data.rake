namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Nhat Tan",
                 email: "nhattan2012@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 role: 3)
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 role: 2)
    50.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   role: 1)
    end
  end
end
