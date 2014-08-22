module Refinery
  module Signups
    class Signup < Refinery::Core::BaseModel
      self.table_name = 'refinery_signups'

      attr_accessible :name, :email, :contact_number, :language_instruction, :inquiry, :translation, :coaching, :consultancy, :question, :position

      alias_attribute :message, :question

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :name, :presence => true
    end
  end
end
