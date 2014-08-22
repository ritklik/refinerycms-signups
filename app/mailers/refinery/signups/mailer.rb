module Refinery
  module Signups
    class Mailer < ActionMailer::Base

      def confirmation(signup, request)
        @signup = signup
        mail :subject  => Refinery::Signups::Setting.confirmation_subject,
             :to       => signup.email,
             :from     => "\"#{Refinery::Core.site_name}\" <info@sourceleader.ph>",
             :reply_to => Refinery::Signups::Setting.notification_recipients.split(',').first
      end

      def notification(signup, request)
        @signup = signup
        mail :subject  => Refinery::Signups::Setting.notification_subject,
             :to       => Refinery::Signups::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <info@sourceleader.ph>"
      end

    end
  end
end
