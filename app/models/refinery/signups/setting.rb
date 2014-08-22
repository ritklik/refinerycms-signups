module Refinery
  module Signups
    class Setting < Refinery::Core::BaseModel

      class << self
        def confirmation_body
          Refinery::Setting.find_or_set(:signup_confirmation_body,
            "Hello %name%,\n\nThis email is a confirmation that your message has been sent to Source Leader International. You will hear back from us no later than two business days.\n\nThank you,\nSource Leader"
          )
        end

        def confirmation_subject
          Refinery::Setting.find_or_set(:signup_confirmation_subject,
                                        "Thank you for your message")
        end

        def confirmation_subject=(value)
          Refinery::Setting.set(:signup_confirmation_subject, value)
        end

        def notification_recipients
          Refinery::Setting.find_or_set(:signup_notification_recipients,
                                        (Role[:refinery].users.first.try(:email) if defined?(Role)).to_s)
        end

        def notification_subject
          Refinery::Setting.find_or_set(:signup_notification_subject,
                                        "New signup from your website")
        end
      end

    end
  end
end
