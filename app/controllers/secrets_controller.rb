class SecretsController < ApplicationController
    before_action :require_login, only: [:index, :create, :destroy]

    def index
        @likes = Like.all
        @secrets = Secret.all
    end

    def new
        
    end

    def create
        user = User.find(params[:secrets][:user_id])
        user.secrets.create(content: params[:secrets][:content])
        redirect_to "/users/#{params[:secrets][:user_id]}"
    end

    def show
        
    end

    def edit
        
    end

    def update

    end

    def destroy

        secret = Secret.find(params[:id])
        if secret.user == current_user
            secret.destroy
            redirect_to "/users/#{params[:user_id]}"
        else 
            redirect_to "/secrets"
        end
    end

end