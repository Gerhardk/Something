class BlocksController < ApplicationController

  def index
    @blocks = Block.all
  end

  def show
    @block = find_block
  end

  def new
    @block = Block.new
  end

  def edit 
    @block = find_block
  end

  def update
    @block = find_block
    if @block.update(block_params)
      redirect_to @block, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @block = Block.create(block_params)
    if @block.valid?
      redirect_to @block
    else
      render :new
    end
  end

  def destroy
    find_block.destroy

    redirect_to blocks_path
  end

  private

  def find_block
    @block = Block.find(params[:id])
  end

  def block_params
    params.require(:block).permit(:game_id, :x, :y)
  end
end 
