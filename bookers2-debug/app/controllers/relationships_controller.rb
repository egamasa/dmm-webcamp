class RelationshipsController < ApplicationController

  # フォローする
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー解除
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロイー取得
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  # フォロワー取得
  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end
end
