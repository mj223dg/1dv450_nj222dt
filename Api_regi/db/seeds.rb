# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Admin User", email:"admin@admin.com", password: "adminpassword",
            password_confirmation: "adminpassword", admin: true)
@test = User.create(name: "Test-User1", email:"User1@example.com", password: "user1password",
            password_confirmation: "user1password")

@test2 = User.create(name: "Test-User2", email: "User2@example.com", password: "user2password",
                         password_confirmation: "user2password")



@test.api.create(name: "Apikeytest1", api_key: "12313123124414214")
@test.api.create(name: "Apikeytest2", api_key: "asdd121d121d21d2d12")

@test2.api.create(name: "Apikeytest3", api_key: "12d12d1231d1d1d")
@test2.api.create(name: "Apikeytest4", api_key: "12d1d12d1d12d21d")