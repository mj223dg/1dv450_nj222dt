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

@school = School.create(name: "Lars kagg", description: "asdasdasdasd")
@school2 = School.create(name: "Stagg", description: "wewewewewewewe")
@school3 = School.create(name: "Cis", description: "wewewewewewewe")
@school4 = School.create(name: "Linne", description: "wewewewewewewe")

# @creator1 = Creator.create(email: "User1@example.com")
# @creator2 = Creator.create(email: "User2@example.com")

# @school.creator = @creator1
# @school2.creator = @creator2
# @school3.creator = @creator1
# @school4.creator = @creator2

@school.position = Position.create(address: "Långviksvägen 23, Kalmar")
@school2.position  = Position.create(address: "Skräddaretorpsvägen 10, Kalmar")
@school3.position  = Position.create(address: "Södra Långgatan 6, Kalmar")
@school4.position  = Position.create(address: "Skräddaretorpsvägen 6, Kalmar")


@tag = Tag.create(name: "Bra skola")
@tag2 = Tag.create(name: "Dålig skola")
@tag3 = Tag.create(name: "Ok skola")

@school.tags << @tag
@school2.tags << @tag2
@school3.tags << @tag3
@school4.tags << @tag3