class Agrovet < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :owner_name, presence: true
  validates :owner_phone, presence: true
  validates :owner_email, presence: true
  validates :user_id, presence: true

  # def self.search(search)
  #   if search
  #     where(["name LIKE ?","%#{search}%"])
  #   else
  #     all
  #   end
  # end

    # Method to retrieve the latest form entry for the agrovet
end
