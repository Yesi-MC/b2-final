class Doctor < ApplicationRecord
  belongs_to :hospital

  has_many :doctor_surgeris
  has_many :surgeries, through: :doctor_surgeries 
end
