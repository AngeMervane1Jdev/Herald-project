# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..5).each do |i|
   User.create({name:"Aholo#{i}",surname:"Cyannon",email:"Champion#{i}@gmaol.com",tel:'63255636',password:"00000000",lieu:'Adjakome',birthday:DateTime.now,position:'Agent double',address:'Quelque part'})
end
(1..5).each do |i|
    Assistant.create({nom:"Aholo#{i}",prenoms:"Cyannon Monday",email:"Champion#{i}@gmail.com",contact:'63255636',password:"00000000"})
end
(1..5).each do |i|
   Discussion.create({user_id:i,category:'fiscale',titre:'Discussion fiscale'})
end
(1..5).each do |i|
   Discussion.create({user_id:i,category:'juridique',titre:'Discussion juridique'})
end
(1..5).each do |i|
  1..2.each do |j|
    Commentaire.create({send_by:"user",discussion_id:i,message:"Bonjour #{i}"})
  end
end
(1..5).each do |i|
  (1..5).each do |j|
    Commentaire.create({send_by:"assisant",discussion_id:i,message:"Comment allez vous? #{j}"})
  end
end