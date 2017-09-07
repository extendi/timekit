# frozen_string_literal: true

module Timekit
  class User
    # Client class for the user resource
    class Client < Timekit::Client
      API_PATH = '/resources'

      def me
        get(API_PATH + '/me')
      end

      def timezone(email)
        get(API_PATH + '/timezone/' + email)
      end

      def update(
        first_name = nil,
        last_name = nil,
        timezone = nil,
        password = nil
      )
        params = {}

        params[:first_name] = first_name if first_name
        params[:last_name] = last_name if last_name
        params[:timezone] = timezone if timezone
        params[:password] = password if password

        put(API_PATH + '/me', params)
      end

      def create(
        name = nil,
        timezone = nil,
        email = nil,
        first_name = nil,
        last_name = nil,
        password = nil
      )
        params = {}

        params[:name] = name if name
        params[:timezone] = timezone if timezone
        params[:email] = email if email
        params[:first_name] = first_name if first_name
        params[:last_name] = last_name if last_name
        params[:password] = password if password

        post(API_PATH, params)
      end

      def reset_password(email)
        params = {
          email: email
        }

        post(API_PATH + '/resetpassword', params)
      end
    end
  end
end
