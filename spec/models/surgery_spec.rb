require 'rails_helper'

RSpec.describe Surgery, type: :model do
   before(:each) do
    @hospital1 = Hospital.create!(name: "Number1 Hospital")
    @hospital2 = Hospital.create!(name: "Name of Hospital") 
    @hospital3 = Hospital.create!(name: "No Name Hospital")

    @doctor1 = Doctor.create!(name: "Naruto Uzumaki", specialty: "Pediatric Surgery", university_attended: "Shinobi Academy", hospital_id: @hospital1.id)
    @doctor2 = Doctor.create!(name: "Sakura Haruno", specialty: "Physical Therapy", university_attended: "Demon Slayer Academy", hospital_id: @hospital2.id)
    @doctor3 = Doctor.create!(name: "Lady Tsunade", specialty: "Plastic Surgery", university_attended: "My Hero Academia", hospital_id: @hospital3.id)
    @doctor4 = Doctor.create!(name: "Ten Ten", specialty: "Cardiac Surgery", university_attended: "Regis University", hospital_id: @hospital3.id)

    @surgery1 = Surgery.create!(title: "knee surgery", day_of_week: "Monday", room_number: 305)
    @surgery2 = Surgery.create!(title: "heart surgery", day_of_week: "Tuesday", room_number: 305)
    @surgery3 = Surgery.create!(title: "plastic surgery", day_of_week: "Tuesday", room_number: 305)
    @surgery4 = Surgery.create!(title: "hand surgery", day_of_week: "Monday", room_number: 305)
    @surgery5 = Surgery.create!(title: "hand surgery", day_of_week: "Thursday", room_number: 305)

    DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery1.id)
    DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery2.id)
    DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery3.id)
    DoctorSurgery.create!(doctor_id: @doctor2.id, surgery_id: @surgery2.id)
    DoctorSurgery.create!(doctor_id: @doctor2.id, surgery_id: @surgery3.id)
    DoctorSurgery.create!(doctor_id: @doctor3.id, surgery_id: @surgery2.id)
    DoctorSurgery.create!(doctor_id: @doctor3.id, surgery_id: @surgery3.id)
  end 
  describe 'relationships' do
    it {should have_many :doctors }
    it {should have_many(:doctors).through(:doctor_surgeries)}
  end

  describe 'methods' do
    it "can group surgeries by date" do 

    expect(Surgery.date_listed(@surgery1.day_of_week)).to eq([@surgery1, @surgery4])
    end
  end
end
