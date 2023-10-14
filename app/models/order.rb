class Order < ApplicationRecord
  belongs_to :agrovet
  has_one :user, through: :agrovet
  has_many :products, through: :agrovet

end
