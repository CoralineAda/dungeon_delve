# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Command.create(
  name: "move",
  synonyms: %w{move go travel north south east west}.to_json,
  handler_class: "Room",
  handler_method: "move_to",
  takes_arguments: true
)

Command.create(
  name: "look",
  synonyms: %w{look}.to_json,
  handler_class: "Room",
  handler_method: "describe"
)

Command.create(
  name: "take",
  synonyms: %w{take pick get},
  handler_class: "Item",
  handler_method: "take",
  takes_arguments: true
)
