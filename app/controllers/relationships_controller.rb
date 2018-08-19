class RelationshipsController < ApplicationController

  def create
      current_user.follow!(User.find(params["id"])
  end

  def destroy
    if current_user.folowing? (User.find(params["id"]))
       currente_user.unfollow! (User.find(params["id"]))
    else
      alert: 'Você não segue este usuário'
  end


end
