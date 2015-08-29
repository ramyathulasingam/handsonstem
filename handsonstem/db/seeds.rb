# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

workshop = Workshop.create([{ title: 'Bianca',
                         imageSource: 'https://s3-us-west-2.amazonaws.com/questr/images/459895765.107559.jpg',
                         startdate: 2.days.ago,
                         enddate: 2.days.ago,
                         price: 100,
                         friendliness: 98
                         skills_taught: "Android, Java"                         
                          }])