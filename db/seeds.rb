# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DoctorSurgery.destroy_all 
Doctor.destroy_all 
Hospital.destroy_all 
Surgery.destroy_all 

hospital1 = Hospital.create!(name: "Number1 Hospital")
hospital2 = Hospital.create!(name: "Name of Hospital") 
hospital3 = Hospital.create!(name: "No Name Hospital")

doctor1 = Doctor.create!(name: "Naruto Uzumaki", specialty: "Pediatric Surgery", university_attended: "Shinobi Academy", hospital_id: hospital1.id)
doctor2 = Doctor.create!(name: "Sakura Haruno", specialty: "Physical Therapy", university_attended: "Demon Slayer Academy", hospital_id: hospital2.id)
doctor3 = Doctor.create!(name: "Lady Tsunade", specialty: "Plastic Surgery", university_attended: "My Hero Academia", hospital_id: hospital3.id)
doctor4 = Doctor.create!(name: "Ten Ten", specialty: "Cardiac Surgery", university_attended: "Regis University", hospital_id: hospital3.id)

surgery1 = Surgery.create!(title: "knee surgery", day_of_week: "Monday", room_number: 305)
surgery2 = Surgery.create!(title: "heart surgery", day_of_week: "Tuesday", room_number: 305)
surgery3 = Surgery.create!(title: "plastic surgery", day_of_week: "Thursday", room_number: 305)
surgery4 = Surgery.create!(title: "hand surgery", day_of_week: "Friday", room_number: 305)
surgery5 = Surgery.create!(title: "foot surgery", day_of_week: "Friday", room_number: 305)

DoctorSurgery.create!(doctor_id: doctor1.id, surgery_id: surgery1.id)
DoctorSurgery.create!(doctor_id: doctor1.id, surgery_id: surgery2.id)
DoctorSurgery.create!(doctor_id: doctor1.id, surgery_id: surgery3.id)
DoctorSurgery.create!(doctor_id: doctor2.id, surgery_id: surgery2.id)
DoctorSurgery.create!(doctor_id: doctor2.id, surgery_id: surgery3.id)
DoctorSurgery.create!(doctor_id: doctor3.id, surgery_id: surgery2.id)
DoctorSurgery.create!(doctor_id: doctor3.id, surgery_id: surgery3.id)
DoctorSurgery.create!(doctor_id: doctor4.id, surgery_id: surgery3.id)
DoctorSurgery.create!(doctor_id: doctor4.id, surgery_id: surgery4.id)
DoctorSurgery.create!(doctor_id: doctor4.id, surgery_id: surgery5.id)
