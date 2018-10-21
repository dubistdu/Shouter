class ShoutsController < ApplicationController

  def show
    @shout = Shout.find(params[:id])
  end

  def create
    shout = current_user.shouts.create(shout_params)
    # redirect to dashborad and show if either it was a success or not
    redirect_to root_path, redirect_option_for(shout)
  end

  private
  def shout_params
    params.require(:shout).permit(:body)
  end

  def redirect_option_for(shout)
    if shout.persisted?
      { notice: "Shouted successfully!" }
    else
      { alert: "Could not shout" }
    end
  end
end
