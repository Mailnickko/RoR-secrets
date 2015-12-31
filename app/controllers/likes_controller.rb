class LikesController < ApplicationController
    before_action :require_login, only: [:index, :create, :destroy]

    def index
        
    end

    def new
        
    end

    def create
        secret = Secret.find(params[:secret_id])
        secret.likes.create(user_id: params[:user_id],secret_id: params[:secret_id])
        redirect_to "/secrets"
    end

    def show
        
    end

    def edit
        
    end

    def update

    end

    def destroy

        like = Like.find_by(user_id: params[:user_id], secret_id: params[:secret_id])
        if (like)
            like.destroy  
            redirect_to "/secrets"
        else 
            redirect_to "/secrets"
        end
    end

end