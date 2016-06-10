# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  contact = Contact.new
  contact.cfname = Faker::Name.first_name
  contact.clname = Faker::Name.last_name
  contact.cemail = Faker::Internet.free_email
  contact.cdob = Faker::Date.between(200.days.ago, Date.today)
  contact.caddress = Faker::Address.state
  contact.cphone = Faker::PhoneNumber.cell_phone
  contact.ccompany = Faker::Company.name
  contact.cindustry = ["Consulting", "Telecom", "Engineering", "IT"].sample
  contact.crelation = ["Acquintance", "Friend", "Co-worker", "Classmate"].sample
  contact.user_id = 1
  contact.save

  rand(8).times do
    interact = Interact.new
    interact.contact_id = contact.id
    interact.ititle = Faker::Lorem.word
    interact.ibody = Faker::Lorem.sentence
    interact.idate = Faker::Date.between(150.days.ago, Date.today)
    interact.save
  end
end
