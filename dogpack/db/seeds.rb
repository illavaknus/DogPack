# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Dogs
fido = User.new(name: 'Fido', email: 'fido@dogpack.com', owner: 'John', age: '1 year old',
             breed: 'Border Collie', image_url: '/img/fido.jpg', location: 'Beacon Hill',
             longitude: -71.069859, latitude: 42.360109, size: 'medium')
fido .password = "dogpack"
fido .password_confirmation = "dogpack"
fido.save
fido.reload

lassy = User.new(name: 'Lassy', email: 'lassy@dogpack.com', owner: 'Jim', age: '2 years old',
             breed: 'Bull Terrier', image_url: '/img/lassy.jpg', location: 'Back Bay',
             longitude: -71.077182 , latitude: 42.354165, size: 'medium')
lassy.password = "dogpack"
lassy.password_confirmation = "dogpack"
lassy.save
lassy.reload

cupcake = User.new(name: 'Cupcake', email: 'cupcake@dogpack.com', owner: 'Jackie', age: '2 years old',
             breed: 'Pomeranian', image_url: '/img/cupcake.jpg', location: 'Beacon Hill',
             longitude: -71.066377, latitude: 42.360335, size: 'small')
cupcake.password = "dogpack"
cupcake.password_confirmation = "dogpack"
cupcake.save
cupcake.reload

allen = User.new(name: 'Allen', email: 'allen@dogpack.com', owner: 'Colton', age: '3 years old',
             breed: 'Shiba', image_url: '/img/allen.jpg', location: 'Harvard Square',
             longitude: -71.069859, latitude: 42.360109, size: 'medium')
allen.password = "dogpack"
allen.password_confirmation = "dogpack"
allen.save
allen.reload

tony = User.new(name: 'Tony', email: 'tony@dogpack.com', owner: 'Tom', age: '1 year old',
             breed: 'German Shepard', image_url: '/img/tony.jpg', location: 'Porter Square',
             longitude: -71.119968 , latitude: 42.386482, size: 'medium')
tony.password = "dogpack"
tony.password_confirmation = "dogpack"
tony.save
tony.reload

george = User.new(name: 'George', email: 'george@dogpack.com', owner: 'Gabrielle ', age: '4 years old',
             breed: 'Labrador Retriever', image_url: '/img/george.jpg', location: 'Beacon Hill',
             longitude: -71.069376, latitude: 42.35867, size: 'large')
george.password = "dogpack"
george.password_confirmation = "dogpack"
george.save
george.reload

lance = User.new(name: 'Lance', email: 'lance@dogpack.com', owner: 'Jessica', age: '2 years old',
             breed: 'Syberian Huskie', image_url: '/img/lance.jpg', location: 'Central Square',
             longitude: -71.099287, latitude: 42.36099, size: 'medium')
lance.password = "dogpack"
lance.password_confirmation = "dogpack"
lance.save
lance.reload

brock = User.new(name: 'Brock', email: 'brock@dogpack.com', owner: 'Marie', age: '1 year old',
             breed: 'Border Collie', image_url: '/img/brock.jpg', location: 'Harvard Square',
             longitude: -71.123595, latitude: 42.373603, size: 'medium')
brock.password = "dogpack"
brock.password_confirmation = "dogpack"
brock.save
brock.reload

coco = User.new(name: 'Coco', email: 'coco@dogpack.com', owner: 'Isabel', age: '3 years old',
             breed: 'Pomeranian', image_url: '/img/coco.jpg', location: 'Back Bay',
             longitude: -71.074945, latitude: 42.354306, size: 'small')
coco.password = "dogpack"
coco.password_confirmation = "dogpack"
coco.save
coco.reload

roxy = User.new(name: 'Roxy', email: 'roxy@dogpack.com', owner: 'Kathleen', age: '10 months old',
             breed: 'Maltese', image_url: '/img/roxy.jpg', location: 'Back Bay',
             longitude: -71.102647, latitude: 42.361711, size: 'small')
roxy.password = "dogpack"
roxy.password_confirmation = "dogpack"
roxy.save

carrie = User.new(name: 'Carrie', email: 'carrie@dogpack.com', owner: 'Logan', age: '3 years old',
             breed: 'Samoyed', image_url: '/img/carrie.jpg', location: 'Beacon Hill',
             longitude: -71.065418, latitude: 42.359983, size: 'large')
carrie.password = "dogpack"
carrie.password_confirmation = "dogpack"
carrie.save


#Invitations
Meetup.create(sender_id: lassy.id, recipient_id: fido.id, accept_status: 0, 
              message: "Let's play frisbee!", venue: 'Boston Commons', date: Time.new(2013, "may", 25, 17, 00, 00));
Meetup.create(sender_id: tony.id, recipient_id: fido.id, accept_status: 0, 
              message:"Let's meetup near the boathouse on the esplanade!", venue: 'The Esplanade', date: Time.new(2013, "may", 30, 16, 00, 00));

#Upcoming Meetups
Meetup.create(sender_id: tony.id, recipient_id: fido.id, accept_status: 1,
              message: "Let's get in an early jog with the dogs", venue: 'The Esplanade', date: Time.new(2013, "may", 22, 6, 00, 00))
Meetup.create(sender_id: lance.id, recipient_id: fido.id, accept_status: 1,
              message: "Let me know if this time works for you!", venue: 'Kendall Square', date: Time.new(2013, "may", 22, 19, 00, 00))

              
#Previous Meetups
Meetup.create(sender_id: allen.id, recipient_id: fido.id, accept_status: 1,
              message: "How about an early morning walk in Fenway?", venue: 'Fenway', date: Time.new(2013, "may", 1, 6, 00, 00))
Meetup.create(sender_id: carrie.id, recipient_id: fido.id, accept_status: 1,
              message: "Carrie needs a new friend!", venue: 'Back Bay', date: Time.new(2013, "may", 2, 18, 00, 00))
Meetup.create(sender_id: coco.id, recipient_id: fido.id, accept_status: 1,
              message: "Coco wants a pal to walk with!", venue: 'Beacon Hill', date: Time.new(2013, "may", 3, 17, 00, 00))
Meetup.create(sender_id: brock.id, recipient_id: fido.id, accept_status: 1,
              message: "Late night walk with the dogs?", venue: 'Coolidge Corner', date: Time.new(2013, "may",4, 13, 00, 00))





