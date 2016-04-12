class School < ActiveRecord::Base
  belongs_to :creator
  belongs_to :position, :dependent => :destroy
  has_and_belongs_to_many :tags

  validates :name, presence: true
  validates :description, presence: true
end
