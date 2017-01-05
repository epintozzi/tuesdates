class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    @group.users = [current_user]
    if @group.save
      flash[:success] = "Your group was successfully created"
      redirect_to group_path(@group)
    else
      flash[:failure] = "There was a problem creating your group. Please try again."
      render :new
    end
  end

  def update

  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:id, :name, :user_id)
  end

end
