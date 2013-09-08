# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adminUser = User.new(username: 'admin', email: 'admin@example.com', password: 'moneyvate', password_confirmation: 'moneyvate')
adminUser.skip_confirmation!
adminUser.save

client_types = ClientType.create([{name: 'Uncategorized'}, {name: 'Individual'}, {name: 'Company'}])
contact_types = ContactType.create([{name: 'Uncategorized'}, {name: 'Individual'}, {name: 'Company'}])
