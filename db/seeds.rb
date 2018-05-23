# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mom = User.find_by(email: "mom@mail.com")
amy = User.find_by(email: "amy@gmail.com")
alex = User.find_by(email: "demo@mail.com")

our_house = Group.find_by(name: "Our House")
family = Group.find_by(name: "Family")

tacos = Recipe.find_by(url: "http://www.sfgate.com/food/recipes/detail/?rid=17022&sorig=qs")

if mom && our_house
  sunday = Date.today.beginning_of_week

  meals = (1..30).flat_map do |i|
    [
      {
        name: "Roast",
        user: mom,
        group: family,
        date: (sunday + i.weeks)
      },
      {
        name: "Lasagna",
        user: amy,
        group: our_house,
        date: (sunday + i.weeks + 2.days)
      },
      {
        name: tacos.label,
        user: alex,
        group: our_house,
        date: (sunday + i.weeks + 4.days),
        recipe: tacos
      }
    ]
  end

  Meal.create(meals)
end
