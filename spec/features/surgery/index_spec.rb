require 'rails_helper'

describe "As a visitor when I visit a surgery’s index page ‘/surgeries’" do
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
    @surgery3 = Surgery.create!(title: "plastic surgery", day_of_week: "Thursday", room_number: 305)
    @surgery4 = Surgery.create!(title: "hand surgery", day_of_week: "Friday", room_number: 305)

    DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery1.id)
    DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery2.id)
    DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery3.id)
    DoctorSurgery.create!(doctor_id: @doctor2.id, surgery_id: @surgery2.id)
    DoctorSurgery.create!(doctor_id: @doctor2.id, surgery_id: @surgery3.id)
    DoctorSurgery.create!(doctor_id: @doctor3.id, surgery_id: @surgery2.id)
    DoctorSurgery.create!(doctor_id: @doctor3.id, surgery_id: @surgery3.id)
  end 
    it "I see I see the title of all surgeries & each surgery I see the names of all doctors performing that surgery" do 

    visit "/surgeries"

    within ".surgery-#{@surgery1.id}" do
      expect(page).to have_content(@surgery1.title)
      expect(page).to have_content(@doctor1.name)
    end 

    within ".surgery-#{@surgery2.id}" do
      expect(page).to have_content(@surgery2.title)
      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content(@doctor2.name)
      expect(page).to have_content(@doctor3.name)
      expect(page).not_to have_content(@doctor4.name)
    end 
  end 
  it "can click on a surgery title to be taken to surgery show page" do 
     visit "/surgeries"

    expect(page).to have_link(@surgery1.title)
    click_link(@surgery1.title)
    expect(current_path).to eq("/surgeries/#{@surgery1.id}")
  end
end 