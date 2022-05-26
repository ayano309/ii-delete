class Dashboard::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: %w[edit update destroy]
  layout "dashboard/dashboard"

  def index
    @items = Item.all
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to dashboard_items_path, notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to dashboard_items_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to dashboard_items_path
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :content)
    end
end
