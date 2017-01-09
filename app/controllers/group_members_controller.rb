class GroupMembersController < ApplicationController

  def new
    @group_member = GroupMember.new(group_id: params[:group_id])
  end

  def create
  end

end
