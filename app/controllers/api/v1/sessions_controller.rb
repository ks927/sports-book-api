module Api
    module V1
        class UsersController < ApplicationController
            def create
                user_email = params[:sessions][:email]
                user_password = params[:sessions][:password]
                user = user_email.present? && User.find_by_email(email: user_email)

                if user.valid_password? user_password
                    sign_in user
                    user.generate_authentication_token!
                    user.save
                    render json: { status: 'SUCCESS', message: 'successfully signed in!', data:user }, status: :ok
                else
                    render json: { status: 'ERROR', message: 'invalid email or password combination', data:user.errors.full_messages }, status: :unprocessable_entity  
                end
            end
        end
    end
end