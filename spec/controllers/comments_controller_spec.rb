require 'spec_helper'

describe CommentsController do

  before :each do
    @user = Fabricate(:user)
  end

  let(:valid_attributes) { { "content" => "MyString" } }

  describe "GET index" do
    it "assigns all comments as @comments" do
      comment = Comment.create! valid_attributes
      get :index, {}
      assigns(:comments).should eq([comment])
    end
  end

  describe "GET show" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! valid_attributes
      get :show, {id: comment.to_param}
      assigns(:comment).should eq(comment)
    end
  end

  describe "GET edit" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! valid_attributes
      get :edit, {id: comment.to_param}
      assigns(:comment).should eq(comment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, {comment: valid_attributes}
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {comment: valid_attributes}
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the created comment" do
        post :create, {comment: valid_attributes}
        response.should redirect_to(Comment.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {comment: { "content" => "invalid value" }}
        assigns(:comment).should be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {comment: { "content" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        # Assuming there are no other comments in the database, this
        # specifies that the Comment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Comment.any_instance.should_receive(:update).with({ "content" => "MyString" })
        put :update, {id: comment.to_param, comment: { "content" => "MyString" }}
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, {id: comment.to_param, comment: valid_attributes}
        assigns(:comment).should eq(comment)
      end

      it "redirects to the comment" do
        comment = Comment.create! valid_attributes
        put :update, {id: comment.to_param, comment: valid_attributes}
        response.should redirect_to(comment)
      end
    end

    describe "with invalid params" do
      it "assigns the comment as @comment" do
        comment = Comment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {id: comment.to_param, comment: { "content" => "invalid value" }}
        assigns(:comment).should eq(comment)
      end

      it "re-renders the 'edit' template" do
        comment = Comment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {id: comment.to_param, comment: { "content" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, {id: comment.to_param}
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete :destroy, {id: comment.to_param}
      response.should redirect_to(comments_url)
    end
  end
end
