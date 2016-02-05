class Api < ActiveRecord::Base
    before_create :create_key
    belongs_to :user
    private
      def create_key
        begin
          self.api_key = SecureRandom.hex
        end while self.class.exists?(api_key: api_key)
      end    
end
