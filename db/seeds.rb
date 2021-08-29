# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Photo.destroy_all
ActiveRecord::Base.connection.execute('ALTER SEQUENCE PHOTOS_id_seq RESTART WITH 1')

Photo.create!(
  name: 'Sansa Stark', 
  url: 'http://www.eonline.com/eol_images/Entire_Site/2016112/rs_1024x759-160212091111-1024.game-of-thrones-season-6-5.ch.021216.jpg', 
  description: '', 
  license: 'copyleft')
Photo.create!(
  name: 'Jon Snow luchando', 
  url: 'http://cde.laprensa.e3.pe/ima/0/0/1/4/2/142409.jpg',
  description: 'Jon Snow luchando con su espada', 
  license: 'copyright')
Photo.create!(
  name: 'Daenerys', 
  url: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTN2t2DpH2yRXdBMDz76_QG84rW2z3vhHTSUj9b7_4PoYt2pysw', 
  description: 'Kaleeshi', 
  license: 'copyleft')
Photo.create!(
  name: 'Catelyn Stark', 
  url: 'http://www.telegraph.co.uk/content/dam/tv/2016/06/29/102004117-gameofthrones-catelyn-xlarge_trans++eo_i_u9APj8RuoebjoAHt0k9u7HhRJvuo-ZLenGRumA.jpg', 
  description: '', 
  license: 'copyleft')
Photo.create!(
  name: 'Drogo y Kaleeshi', 
  url: 'http://www.telegraph.co.uk/content/dam/tv/2016/04/27/95999877-game_of_thrones_dany-TV-large_trans++rXQPXGvM58CJoUBPwmOnP3jbyrF8E60tRQ0vXBjgJJg.jpg', 
  description: '', 
  license: 'creative_commons')
Photo.create!(
  name: 'Cersei Lannister', 
  url: 'http://img.wennermedia.com/social/rs-246415-game-of-thrones-cersei-crown-finale-season-6.jpg', 
  description: 'Cersei Lannister sentada en el trono de hierro', 
  license: 'copyleft')
Photo.create!(
  name: 'Hodor', 
  url: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQRaljlb0eLS35_g18dH4MgGyFa7sA18oNB8rIE7XeHU5p1hfhl', 
  description: '', 
  license: 'copyleft')

Photo.create!(
  name: 'Tommen y su madre', 
  url: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTWA-ylzp7DZRZK28tdTOh-4x0Kseot4ENLuOFDMFILgaWF99t1', 
  description: '', 
  license: 'copyleft')

Photo.create!(
  name: 'Caminante blanco', 
  url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHCVRPIq81BRjkJDWqGFdS_HgaVTJntC8r0MLiM9bnn8p_7P7UIA', 
  description: '', 
  license: 'copyleft')

Photo.create!(
  name: 'La Montaña', 
  url: 'http://cdn2.upsocl.com/wp-content/uploads/2016/06/game-of-thrones-5-la-montagna-372x248.jpg', 
  description: 'La Montaña luchando', 
  license: 'copyleft')

