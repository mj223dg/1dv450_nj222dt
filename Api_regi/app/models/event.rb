class Event < ActiveRecord::Base
  belongs_to :positions
  belongs_to :creators
end
