module Refinery
  module Signups
    class SignupsController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/signups/thank_you", :include => [:parts])
      end

      def new
        @signup = Signup.new
      end

      def create
        @signup = Signup.new(params[:signup])

        if @signup.save
          begin
            Mailer.notification(@signup, request).deliver
          rescue => e
            logger.warn "There was an error delivering the signup notification.\n#{e.message}\n"
          end

          if Signup.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@signup, request).deliver
            rescue => e
              logger.warn "There was an error delivering the signup confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to Signup if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_signups_signups_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/signups/new', :include => [:parts])
      end

    end
  end
end
