class SurgeryDoctorsController < ApplicationController 
  def create 
    surgery = Surgery.find(params[:id])
    doctor = Doctor.find_by(name: params["Add A Doctor To This Surgery"])
    DoctorSurgery.create!(doctor_id: doctor.id, surgery_id: surgery.id)
    redirect_to "/surgeries/#{surgery.id}"
  end
end