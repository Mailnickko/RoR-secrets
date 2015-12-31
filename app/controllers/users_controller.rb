class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
                #makes sure user must be logged in to access all pages except :new, :create
    before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
                #only proper;y logged in users can access the functionality of aformentioned sites

    def index
    
    end

    def new
        
    end

    def create
        user = User.new(email: params[:email],
                    name: params[:name],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
        if user.save
            session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        else 
            flash[:errors] = @errors = user.errors.full_messages
            redirect_to "/users/new"
        end
    end

    def show
        @user = User.find(params[:id])
        @secret = @user.secrets
        @like = Like.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update

        user = User.find(params[:id])
        user.email = params[:email]
        user.name = params[:name]

        user.save

        session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        
    end

    def destroy

        user = User.find(params[:id])
        session.delete(:user_id)
        user.destroy
        redirect_to '/sessions/new'
       
    end

end