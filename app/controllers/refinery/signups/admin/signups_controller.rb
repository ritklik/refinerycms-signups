module Refinery
  module Signups
    module Admin
      class SignupsController < Refinery::AdminController

        crudify :'refinery/signups/signup', 
                :title_attribute => "name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_signups
          else
            search_all_signups
          end

          @grouped_signups = group_by_date(@signups)
        end

      end
    end
  end
end
