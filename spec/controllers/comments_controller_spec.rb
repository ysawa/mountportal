require 'spec_helper'

describe CommentsController do

  before :each do
    @user = Fabricate(:user)
    @trek = Fabricate(:trek)
  end

  let(:valid_attributes) { { "content" => "MyString", "trek_id" => @trek.id.to_s } }

  describe "GET index" do
    context 'with NOT singing in' do
      it "returns failure" do
        comment = Comment.create! valid_attributes
        get :index, {format: 'json'}
        response.should_not be_success
      end
    end

    context 'with singing in' do
      before :each do
        user_sign_in(@user)
      end

      it "assigns all comments as @comments" do
        comment = Comment.create! valid_attributes
        get :index, {format: 'json'}
        assigns(:comments).should eq([comment])
      end
    end
  end

  describe "GET show" do
    context 'with NOT singing in' do
      it "returns failure" do
        comment = Comment.create! valid_attributes
        get :show, {id: comment.to_param, format: 'json'}
        response.should_not be_success
      end
    end

    context 'with singing in' do
      before :each do
        user_sign_in(@user)
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        get :show, {id: comment.to_param, format: 'json'}
        assigns(:comment).should eq(comment)
      end
    end
  end

  describe "GET edit" do
    context 'with NOT singing in' do
      it "returns failure" do
        comment = Comment.create! valid_attributes
        get :edit, {id: comment.to_param}
        response.should_not be_success
      end
    end

    context 'with singing in' do
      before :each do
        user_sign_in(@user)
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        get :edit, {id: comment.to_param}
        assigns(:comment).should eq(comment)
      end
    end
  end

  describe "POST create" do
    context 'with NOT singing in' do
      it "returns failure" do
        post :create, {comment: valid_attributes, format: 'json'}
        response.should_not be_success
      end
    end

    context 'with singing in' do
      before :each do
        user_sign_in(@user)
      end

      describe "with valid params" do
        it "creates a new Comment" do
          expect {
            post :create, {comment: valid_attributes, format: 'json'}
          }.to change(Comment, :count).by(1)
        end

        it "assigns a newly created comment as @comment" do
          post :create, {comment: valid_attributes, format: 'json'}
          assigns(:comment).should be_a(Comment)
          assigns(:comment).should be_persisted
        end

        it "returns success" do
          post :create, {comment: valid_attributes, format: 'json'}
          response.should be_success
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved comment as @comment" do
          # Trigger the behavior that occurs when invalid params are submitted
          Comment.any_instance.stub(:save).and_return(false)
          post :create, {comment: { "content" => "invalid value" }, format: 'json'}
          assigns(:comment).should be_a_new(Comment)
        end

        it "returns failure" do
          # Trigger the behavior that occurs when invalid params are submitted
          Comment.any_instance.stub(:save).and_return(false)
          post :create, {comment: { "content" => "invalid value" }, format: 'json'}
          response.should_not be_success
        end
      end
    end
  end

  describe "PUT update" do
    context 'with NOT singing in' do
      it "returns failure" do
        comment = Comment.create! valid_attributes
        put :update, {id: comment.to_param, comment: { "content" => "MyString" }, format: 'json'}
        response.should_not be_success
      end
    end

    context 'with singing in' do
      before :each do
        user_sign_in(@user)
      end

      describe "with valid params" do
        it "updates the requested comment" do
          comment = Comment.create! valid_attributes
          # Assuming there are no other comments in the database, this
          # specifies that the Comment created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Comment.any_instance.should_receive(:update).with({ "content" => "MyString" })
          put :update, {id: comment.to_param, comment: { "content" => "MyString" }, format: 'json'}
        end

        it "assigns the requested comment as @comment" do
          comment = Comment.create! valid_attributes
          put :update, {id: comment.to_param, comment: valid_attributes, format: 'json'}
          assigns(:comment).should eq(comment)
        end

        it "returns success" do
          comment = Comment.create! valid_attributes
          put :update, {id: comment.to_param, comment: valid_attributes, format: 'json'}
          response.should be_success
        end
      end

      describe "with invalid params" do
        it "assigns the comment as @comment" do
          comment = Comment.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Comment.any_instance.stub(:save).and_return(false)
          put :update, {id: comment.to_param, comment: { "content" => "invalid value" }, format: 'json'}
          assigns(:comment).should eq(comment)
        end

        it "returns failure" do
          comment = Comment.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Comment.any_instance.stub(:save).and_return(false)
          put :update, {id: comment.to_param, comment: { "content" => "invalid value" }, format: 'json'}
          response.should_not be_success
        end
      end
    end
  end

  describe "DELETE destroy" do
    context 'with NOT singing in' do
      it "returns failure" do
        comment = Comment.create! valid_attributes
        delete :destroy, {id: comment.to_param}
        response.should_not be_success
      end
    end

    context 'with singing in' do
      before :each do
        user_sign_in(@user)
      end

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
end
