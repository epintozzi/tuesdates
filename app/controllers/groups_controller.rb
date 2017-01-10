class GroupsController < ApplicationController

  def index
    if !current_user
      flash[:warning] = "You must log in to see your groups"
      redirect_to root_path
    else
      @groups = current_user.groups
    end
  end

  def show
    @group = Group.find(params[:id])
    @group_member = GroupMember.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users = [current_user]
    if @group.save
      flash[:success] = "Your group was successfully created"
      redirect_to group_path(@group)
    else
      flash[:failure] = "There was a problem creating your group. Please try again."
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    if @group.save
      flash[:success] = "Your group has been updated"
      redirect_to group_path(@group)
    else
      flash[:warning] =  "Your changes were not saved"
      render :edit
    end

  end

  private

  def group_params
    params.require(:group).permit(:id, :name, :user_id)
  end

end
