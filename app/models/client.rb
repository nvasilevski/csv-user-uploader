class Client < ApplicationRecord
  validates :phone, presence: true, numericality: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
end
