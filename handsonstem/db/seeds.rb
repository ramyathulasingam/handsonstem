# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

workshop = Workshop.create([
  
  { title: 'Technical Interview Practice',
   imageSource: 'http://i.imgur.com/4UMO0Oh.jpg',
   startdate: 20.days.from_now,
   enddate: 2.days.from_now,
   eventUrl: "https://www.eventbrite.com/e/lean-in-interview-preparation-tickets-18375324089",
   price: 100,
   friendliness: 20,
   skills_taught: "Algorithms",
   equiptment_needed: "Notebook"                        
    },
  
    { title: 'Arduino',
     imageSource: 'http://i.imgur.com/OGl9MX8.jpg',
     startdate: 300.days.from_now,
     enddate: 900.days.from_now,
     price: 100,
     eventUrl: "http://workshopweekend.net/arduino",
     friendliness: 80,
     skills_taught: "Arduino",
     equiptment_needed: "Provided"                         
      },
      
  
      { title: 'Tech Inclusion',
       imageSource: 'http://i.imgur.com/c9MJYdg.jpg',
       startdate: 13.days.from_now,
       enddate: 13.days.from_now,
       price: 100,
       friendliness: 90,
       skills_taught: "Communication",
       equiptment_needed: "None"                         
        }
              
                          
                          
                          ])