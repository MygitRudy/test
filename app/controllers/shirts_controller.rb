class ShirtsController < ApplicationController
  def create
    verify_user(params[:user_id])
    @shirt = @user.shirts.create(shirt_params)
    if @shirt.save
      redirect_to user_shirts_path(@user), notice: 'shirt picture successfully uploaded.'
    else
      render :new
    end
  end
  def destroy
    verify_user(params[:user_id])
    @shirt = @user.shirts.find(params[:id])
    @shirt.destroy
    redirect_to user_path(@user)

  end
  def index
    verify_user(params[:user_id])
  end
  def new
    verify_user(params[:user_id])
    @shirts=@user.shirts.all
  end
  
  
  private

  def shirt_params
    params.require(:shirt).permit(:paperpic)
  end
end
