module Api
    module V1
        class UsersController < ApplicationController
            def index
                users = User.all
                render json: { status: 'SUCCESS', data:users }, status: :ok
            end

            def show
                user = User.find(params[:id])
                render json: { status: 'SUCCESS', message: 'user loaded', data:user }, status: :ok
            end

            def create
                user = User.new(user_params)

                if user.save
                    render json: { status: 'SUCCESS', message: 'user created!', data:user }, status: :ok
                else 
                    render json: { status: 'ERROR', message: 'user not created!', data:user.errors.full_messages }, status: :unprocessable_entity

                end
            end

            def destroy
                user = User.find(params[:id])
                user.destroy
                render json: { status: 'SUCCESS', message: 'user deleted!', data:user }, status: :ok
            end

            def update
                user = User.find(params[:id])
                if user.update_attributes(user_params)
                    render json: { status: 'SUCCESS', message: 'user updated!', data:user }, status: :ok
                else 
                    render json: { status: 'ERROR', message: 'user not updated!', data:user.errors.full_messages }, status: :unprocessable_entity

                end
            end

            private

            def user_params
                params.permit(:name, :email, :password)
            end
        end
    end
end