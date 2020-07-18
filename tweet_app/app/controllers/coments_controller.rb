class ComentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @micropost = Micropost.where(micropost_id: current_user.id)
    @coment = @micropost.coments.build(coment_params)
    if @coment.save
      flash[:success] = "コメントしました"
      redirect_to micropost_path(@micropost)
    else
      render micropost_path(@micropost)
    end
  end

  def destroy
  end
  
  private

    def coment_params
      params.require(:coment).permit(:content)
    end
end
