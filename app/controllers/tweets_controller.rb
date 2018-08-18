class TweetsController < ApplicationController
  def create
      @tweet = current_user.tweets.new(tweet_params)

      if @tweet.save #verificando se o tweet é valido
        redirect_to root_path, notice: 'Tweet é salvo'
      else
        redirect_to root_path, alert: 'Tweet não foi salvo'
      end
  end

  private

  def tweet_params #permitindo que o usuário possa mudar somente o content
    params.require(:tweet).permit(:content)
  end

end
