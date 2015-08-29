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
    @group = Group.find(params[:id])
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
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path, notice: "新增討論版成功！"
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
