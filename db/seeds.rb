# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
["Jon", "Ned", "Arya", "Tyrion"].each do |name|
  users << User.create(name: name, github_username: name.downcase, token: SecureRandom.uuid)
end

languages = []
["Go", "Javascript", "Ruby", "Python", "Scala", "Clojure"].each do |lang|
  languages << Language.create(name: lang)
end

requests = []
["Migration1", "Migration2", "Port1", "Port2"].each do |req|
  langs = languages.shuffle
  requests << Request.create(name: req, user: users.shuffle.first, from_language: langs.first, to_language: langs.second)
end

requests.each do |req|
  users.shuffle[0..2].each do |user|
    user.upvotes.create(request: req)
  end
end


