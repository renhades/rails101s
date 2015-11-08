class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    # flash[:notice] = "早安！你好！"
    # flash[:alert] = "晚安！該睡了！"
    # flash[:warning] = "警告！"

    @groups = Group.all    
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def new 
    @group = Group.new
  end

  def edit
    # @group = Group.find(params[:id])
    # 從單純呼叫 group Model 找某筆資料

    # 變成從登入的使用者所擁有的 group 資料，來找尋某筆資料
    @group = current_user.groups.find(params[:id])
  end

  def create
    # @group = Group.create(group_params)
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def update
    # @group = Group.find(params[:id])
    @group = current_user.groups.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path, notice: "新增討論版成功！"
    else
      render :edit
    end
  end

  def destroy
    # @group = Group.find(params[:id])
    @group = current_user.groups.find(params[:id])

    @group.destroy
    redirect_to groups_path, alert: "討論板已刪除！"
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
