class Surgery < ApplicationRecord
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries 

  def self.date_listed(day)
   where(day_of_week: day).to_a
  end
end
