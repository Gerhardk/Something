class BlocksController < ApplicationController

  def index
    @blocks = Block.all
  end

  def show
    @block = Block.find(params[:id])
  end

  def new
    @block = Block.new
  end

  def edit 
    @block = Block.find(params[:id])
  end

  def update
    @block = Block.find(params[:id])
    if @block.update_attributes(block_params)
      redirect_to @block
    end
  end

  def create
    @block = Block.new(block_params)
    if @block.save
      redirect_to @block
    end
  end

  private

  def block_params
    begin
      params.require(:block).permit(:game_id, :x, :y)
    rescue ActionController::ParameterMissing => e
    end
  end
end 
