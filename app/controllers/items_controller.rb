class ItemsController < ApplicationController
	  before_action :authenticate_user!, exist:[:show]
	  before_action :set_item,only:[:edit,:update,:destroy,:show]

	  def new
	  	@item=Item.new
	  end

	  def create
	  	pp params[:item][:user_id]=current_user.id
	  	pp params[:item][:category_id] = params[:category_id]
	  	pp params[:item][:image]
	  	pp @item=Item.create(item_params)
	  	if @item.save
	  		redirect_to root_path
	  	else
	  	render 'new'
	  end
	  end

	  def edit
	  	
	  end

	  def update
	  	@item.update(item_params)
	    redirect_to root_path
	  end

	  def destroy
     @item.destroy
   redirect_to root_path
	  end

	  def show
	  	@comments=Itemcomment.where(item_id: @item.id)
	  end

	  private

	  def item_params
	  	params.require(:item).permit(:name,:description,:user_id,:category_id,:image)
	  end

	  def set_item
	  	@item=Item.find(params[:id])
	  end
end
