class UsersController < ApplicationController
    def index #mostra todos os usuários
      @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

end
