require 'rails_helper'
describe BlocksController do
  def valid_attributes
    {:game_id => 1}
  end

  describe "GET index" do
    it "assigns all blocks as @blocks" do
      block = Block.create! valid_attributes
      get :index
      expect(assigns(:blocks)).to eq([block])
    end
  end

  describe "GET show" do
    it "assigns the requested block as @block" do
      block = Block.create! valid_attributes
      get :show, params: { id: block.id }
      expect(assigns(:block)).to eq(block)
    end
  end

  describe "GET new" do
    it "assigns a new block as @block" do
      get :new
      expect(assigns(:block)).to be_a_new(Block)
    end
  end

  describe "GET edit" do
    it "assigns the requested block as @block" do
      block = Block.create! valid_attributes
      get :edit, params: { id: block.id }
      expect(assigns(:block)).to eq(block)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Block" do
        expect {
          post :create, params: { block: valid_attributes }
        }.to change(Block, :count).by(1)
      end

      it "assigns a newly created block as @block" do
        post :create, params: { block: valid_attributes }
        expect(assigns(:block)).to be_a(Block)
        expect(assigns(:block)).to be_persisted
      end

      it "redirects to the created block" do
        post :create, params: { block: valid_attributes }
        expect(response).to redirect_to(Block.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved block as @block" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Block).to receive(:save).and_return(false)
        # Block.any_instance.stub(:save).and_return(false)
        post :create, params: { block: { name: "Hello"} }
        expect(assigns(:block)).to be_a_new(Block)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested block" do
        block = Block.create! valid_attributes
        # Assuming there are no other blocks in the database, this
        # specifies that the Block created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        allow_any_instance_of(Block).to receive(:update_attributes).with(false)
        # Block.any_instance.should_receive(:update_attributes).with({'x' => '1'})
        put :update, params: { id: block.id, block: {'x' => '1'} }
      end

      it "assigns the requested block as @block" do
        block = Block.create! valid_attributes
        put :update, params: { id: block.id, block: valid_attributes }
        expect(assigns(:block)).to eq(block)
      end

      it "redirects to the block" do
        block = Block.create! valid_attributes
        put :update, params: { id: block.id, block: valid_attributes }
        expect(response).to redirect_to(block)
      end
    end

    describe "with invalid params" do
      it "assigns the block as @block" do
        block = Block.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        # Block.any_instance.stub(:save).and_return(false)
        allow_any_instance_of(Block).to receive(:save).and_return(false)
        put :update, params: { id: block.id, block: { name: "Hello"} }
        expect(assigns(:block)).to eq(block)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested block" do
      block = Block.create! valid_attributes
      expect {
        delete :destroy, params: { id: block.id }
      }.to change(Block, :count).by(-1)
    end
  end
end
