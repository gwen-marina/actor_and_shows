# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TvShow.destroy_all
Actor.destroy_all

actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
actor_3 = Actor.create!(name: "Rhea Seehorn", still_active: true, age: 48)
actor_4 = Actor.create!(name: "Aaron Paul", still_active: true, age: 42)
actor_5 = Actor.create!(name: "Anna Gunn", still_active: true, age: 53)

actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
actor_2.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)
actor_3.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
actor_4.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)
actor_4.tv_shows.create!(name: "Westworld", on_air: true, number_of_episodes: 20)
actor_5.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)