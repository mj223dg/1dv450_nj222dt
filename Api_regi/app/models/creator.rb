class Creator < ActiveRecord::Base
  has_many :schools
  has_secure_password
end
