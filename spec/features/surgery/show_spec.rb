require 'rails_helper'

describe "As a visitor when I visit a surgery’s show page ‘/surgeries/:id’" do
    before(:each) do
    @hospital1 = Hospital.create!(name: "Number1 Hospital")
    @hospital2 = Hospital.create!(name: "Name of Hospital") 
    @hospital3 = Hospital.create!(name: "No Name Hospital")

    @doctor1 = Doctor.create!(name: "Naruto Uzumaki", specialty: "Pediatric Surgery", university_attended: "Shinobi Academy", hospital_id: @hospital1.id)
    @doctor2 = Doctor.create!(name: "Sakura Haruno", specialty: "Physical Therapy", university_attended: "Demon Slayer Academy", hospital_id: @hospital2.id)
    @doctor3 = Doctor.create!(name: "Lady Tsunade", specialty: "Plastic Surgery", university_attended: "My Hero Academia", hospital_id: @hospital3.id)
    @doctor4 = Doctor.create!(name: "Ten Ten", specialty: "Cardiac Surgery", university_attended: "Regis University", hospital_id: @hospital3.id)
    @doctor5 = Doctor.create!(name: "Asami", specialty: "Cardiac Surgery", university_attended: "Regis University", hospital_id: @hospital3.id)

    @surgery1 = Surgery.create!(title: "knee surgery", day_of_week: "Monday", room_number: 305)
    @surgery2 = Surgery.create!(title: "heart surgery", day_of_week: "Tuesday", room_number: 305)
    @surgery3 = Surgery.create!(title: "plastic surgery", day_of_week: "Thursday", room_number: 305)
    @surgery4 = Surgery.create!(title: "hand surgery", day_of_week: "Monday", room_number: 305)

    DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery1.id)
    DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery2.id)
    DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery3.id)
    DoctorSurgery.create!(doctor_id: @doctor2.id, surgery_id: @surgery2.id)
    DoctorSurgery.create!(doctor_id: @doctor2.id, surgery_id: @surgery3.id)
    DoctorSurgery.create!(doctor_id: @doctor3.id, surgery_id: @surgery2.id)
    DoctorSurgery.create!(doctor_id: @doctor3.id, surgery_id: @surgery3.id)
  end 
  it "I see show page I see the title and operating room number of that surgery" do 
    visit "/surgeries/#{@surgery1.id}"

    expect(page).to have_content(@surgery1.title)
    expect(page).to have_content(@surgery1.room_number)
    end 
    it "can see a section header that says 'Other surgeries happening this day of the week:' 
          and under neath it sees surgeris happening on the same day" do 
      visit "/surgeries/#{@surgery1.id}" 

      expect(page).to have_content("Other surgeries happening this day of the week:")
      expect(page).to have_content(@surgery1.title)
      expect(page).to have_content(@surgery4.title)
    end
    it "can see a field with instructions to 'Add A Doctor To This Surgery'" do 
      visit "/surgeries/#{@surgery1.id}" 

      fill_in 'Add A Doctor To This Surgery', with: "Asami"
      click_button "Submit"

      expect(current_path).to eq("/surgeries/#{@surgery1.id}")
      expect(page).to have_content("Asami")
  end 
end 
