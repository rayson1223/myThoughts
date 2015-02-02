require 'rails_helper'

RSpec.describe HashTagsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # HashTag. As you add validations to HashTag, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:hash_tag)
  }

  let(:invalid_attributes) {
    { hash_tag: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HashTagsController. Be sure to keep this updated too.
  let(:valid_session) { FactoryGirl.attributes_for(:user) }

  describe "GET index" do
    it "assigns all hash_tags as @hash_tags" do
      hash_tag = HashTag.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:hash_tags)).to eq([hash_tag])
    end
  end

  describe "GET show" do
    it "assigns the requested hash_tag as @hash_tag" do
      hash_tag = HashTag.create! valid_attributes
      get :show, {:id => hash_tag.to_param}, valid_session
      expect(assigns(:hash_tag)).to eq(hash_tag)
    end
  end

  describe "GET new" do
    it "assigns a new hash_tag as @hash_tag" do
      get :new, {}, valid_session
      expect(assigns(:hash_tag)).to be_a_new(HashTag)
    end
  end

  describe "GET edit" do
    it "assigns the requested hash_tag as @hash_tag" do
      hash_tag = HashTag.create! valid_attributes
      get :edit, {:id => hash_tag.to_param}, valid_session
      expect(assigns(:hash_tag)).to eq(hash_tag)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new HashTag" do
        expect {
          post :create, {:hash_tag => valid_attributes}, valid_session
        }.to change(HashTag, :count).by(1)
      end

      it "assigns a newly created hash_tag as @hash_tag" do
        post :create, {:hash_tag => valid_attributes}, valid_session
        expect(assigns(:hash_tag)).to be_a(HashTag)
        expect(assigns(:hash_tag)).to be_persisted
      end

      it "redirects to the created hash_tag" do
        post :create, {:hash_tag => valid_attributes}, valid_session
        expect(response).to redirect_to(HashTag.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved hash_tag as @hash_tag" do
        post :create, {:hash_tag => invalid_attributes}, valid_session
        expect(assigns(:hash_tag)).to be_a_new(HashTag)
      end

      it "re-renders the 'new' template" do
        post :create, {:hash_tag => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:hash_tag)
      }

      it "updates the requested hash_tag" do
        hash_tag = HashTag.create! valid_attributes
        put :update, {:id => hash_tag.to_param, :hash_tag => new_attributes}, valid_session
        hash_tag.reload
        # gskip("Add assertions for updated state")
      end

      it "assigns the requested hash_tag as @hash_tag" do
        hash_tag = HashTag.create! valid_attributes
        put :update, {:id => hash_tag.to_param, :hash_tag => valid_attributes}, valid_session
        expect(assigns(:hash_tag)).to eq(hash_tag)
      end

      it "redirects to the hash_tag" do
        hash_tag = HashTag.create! valid_attributes
        put :update, {:id => hash_tag.to_param, :hash_tag => valid_attributes}, valid_session
        expect(response).to redirect_to(hash_tag)
      end
    end

    describe "with invalid params" do
      it "assigns the hash_tag as @hash_tag" do
        hash_tag = HashTag.create! valid_attributes
        put :update, {:id => hash_tag.to_param, :hash_tag => invalid_attributes}, valid_session
        expect(assigns(:hash_tag)).to eq(hash_tag)
      end

      it "re-renders the 'edit' template" do
        hash_tag = HashTag.create! valid_attributes
        put :update, {:id => hash_tag.to_param, :hash_tag => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested hash_tag" do
      hash_tag = HashTag.create! valid_attributes
      expect {
        delete :destroy, {:id => hash_tag.to_param}, valid_session
      }.to change(HashTag, :count).by(-1)
    end

    it "redirects to the hash_tags list" do
      hash_tag = HashTag.create! valid_attributes
      delete :destroy, {:id => hash_tag.to_param}, valid_session
      expect(response).to redirect_to(hash_tags_url)
    end
  end

end
