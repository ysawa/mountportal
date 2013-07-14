require 'spec_helper'

describe TreksController do

  let(:valid_attributes) { { "name" => "MyString" } }

  describe "GET index" do
    it "assigns all treks as @treks" do
      trek = Trek.create! valid_attributes
      get :index, {}
      assigns(:treks).should eq([trek])
    end
  end

  describe "GET show" do
    it "assigns the requested trek as @trek" do
      trek = Trek.create! valid_attributes
      get :show, {id: trek.to_param}
      assigns(:trek).should eq(trek)
    end
  end

  describe "GET new" do
    it "assigns a new trek as @trek" do
      get :new, {}
      assigns(:trek).should be_a_new(Trek)
    end
  end

  describe "GET edit" do
    it "assigns the requested trek as @trek" do
      trek = Trek.create! valid_attributes
      get :edit, {id: trek.to_param}
      assigns(:trek).should eq(trek)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Trek" do
        expect {
          post :create, {trek: valid_attributes}
        }.to change(Trek, :count).by(1)
      end

      it "assigns a newly created trek as @trek" do
        post :create, {trek: valid_attributes}
        assigns(:trek).should be_a(Trek)
        assigns(:trek).should be_persisted
      end

      it "redirects to the created trek" do
        post :create, {trek: valid_attributes}
        response.should redirect_to(Trek.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved trek as @trek" do
        # Trigger the behavior that occurs when invalid params are submitted
        Trek.any_instance.stub(:save).and_return(false)
        post :create, {trek: { "name" => "" }}
        assigns(:trek).should be_a_new(Trek)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Trek.any_instance.stub(:save).and_return(false)
        post :create, {trek: { "name" => "" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested trek" do
        trek = Trek.create! valid_attributes
        # Assuming there are no other treks in the database, this
        # specifies that the Trek created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Trek.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {id: trek.to_param, trek: { "name" => "MyString" }}
      end

      it "assigns the requested trek as @trek" do
        trek = Trek.create! valid_attributes
        put :update, {id: trek.to_param, trek: valid_attributes}
        assigns(:trek).should eq(trek)
      end

      it "redirects to the trek" do
        trek = Trek.create! valid_attributes
        put :update, {id: trek.to_param, trek: valid_attributes}
        response.should redirect_to(trek)
      end
    end

    describe "with invalid params" do
      it "assigns the trek as @trek" do
        trek = Trek.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Trek.any_instance.stub(:save).and_return(false)
        put :update, {id: trek.to_param, trek: { "name" => "" }}
        assigns(:trek).should eq(trek)
      end

      it "re-renders the 'edit' template" do
        trek = Trek.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Trek.any_instance.stub(:save).and_return(false)
        put :update, {id: trek.to_param, trek: { "name" => "" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested trek" do
      trek = Trek.create! valid_attributes
      expect {
        delete :destroy, {id: trek.to_param}
      }.to change(Trek, :count).by(-1)
    end

    it "redirects to the treks list" do
      trek = Trek.create! valid_attributes
      delete :destroy, {id: trek.to_param}
      response.should redirect_to(treks_url)
    end
  end
end
