class DataEntry < ApplicationRecord
  belongs_to :agrovet
  has_one :user, through: :agrovet

end
