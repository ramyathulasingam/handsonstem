# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

workshop = Workshop.create([{ title: 'Bianca',
                         imageSource: 'https://s3-us-west-2.amazonaws.com/questr/images/459895765.107559.jpg',
                         email: 'bianca.olaes@gmail.com',
                         password: 'hello123',
                         is_employer: false,
                         position_title: 'Administrative Assistant',
                         zip_code: '92626',
                         description: "MS Word, Docs, Powerpoint,Office,Excel, Bachelor's in Psychology.  Customer service, sales and secretarial skills. General Office duties. 2yrs experience." },