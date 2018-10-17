module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include SessionsHelper
    identified_by :message_user

    def connect
      self.message_user = find_verified_user
    end

    private

      def find_verified_user
        if verified_user = User.find_by(id: cookies.signed[:user_id])
          verified_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
