class GroupMembersController < ApplicationController

  def new
    @group_member = GroupMember.new(group_id: params[:group_id])
    @user = User.find_or_create_by(email: params[:email])
    @group_member.user = @user
  end

  def create
    @group_member = GroupMember.new(group_id: params[:group_id])
    @group_member.user = User.find_or_create_by(user_params)
    if GroupMember.find_by(user_id: @group_member.user.id, group_id: params[:group_id])
      flash[:warning] = "#{@group_member.user.email} already belongs to #{@group_member.group.name}"
      render :new
    elsif @group_member.save
      flash[:success] = "#{@group_member.user.email} has been invited to join #{@group_member.group.name}"
      redirect_to group_path(@group_member.group)
    else
      flash[:failure] = "Invitation failed. Please try again."
      render :new
    end
  end

  private

  def group_member_params
    params.require(:group_member).permit(:id, :group_id, :user_id)
  end

  def user_params
    params.require(:user).permit(:id, :email)
  end

end
