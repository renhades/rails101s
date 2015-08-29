class GroupsController < ApplicationController
  def index
    flash[:notice] = "早安！你好！"
    # flash[:alert] = "晚安！該睡了！"
    # flash[:warning] = "警告！"

    @groups = Group.all    
  end

  def show
    @group = Group.find(params[:id])
  end

  def new 
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
