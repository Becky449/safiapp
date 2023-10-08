class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          enum role: [:user, :admin]
          after_initialize :set_default_role, :if => :new_record?
          def set_default_role
            self.role ||= :user
          end
          has_many :agrovets
          
          validates :firstname, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 20}
          validates :lastname, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 20}     
end
