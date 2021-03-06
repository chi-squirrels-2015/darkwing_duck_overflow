require 'rails_helper'

describe QuestionsController do

  include Devise::TestHelpers

  # def setup
  #   @request.env["devise.mapping"] = Devise.mappings[:user]
  #   user = FactoryGirl.create!(:user)
  #   sign_in user
  # end

  let(:user) {User.create!(username: "Babe", email: "user@gmail.com", password: "password")}

  let(:question) {Question.create!(title: "Does it work?", content: "Why doesn't this thing work", vote_count: 2, user_id: user.id)}

  let(:invalid_question) {Question.create(title: "Does it work?", content: "Why doesn't this thing work", vote_count: 2, user_id: nil)}

  describe "get #index" do
    it "assigns all questions as @questions" do
      get :index
      expect(assigns(:questions)).to eq(Question.all)
    end

  end

  describe "Get #show" do
    it "assigns the requested questions as @question" do
      get :show, {id: question.to_param}
      expect(assigns(:question)).to eq(question)
    end

    # it "assigns a user to the question" do
    #   get :show, {id: question.to_param}
    #   expect(assigns(:user)).to eq(question.user)
    # end

  end



  describe "GET #new" do
    it "should generate a new instance of a question" do
      get :new
        expect(assigns(:question)).to be_an_instance_of(Question)
    end

  end

  describe "POST create" do
    context "when valid params are passed" do
      it "creates a new Question" do
        # p question.to_param
        post :create, question: {id: question.to_param}
        expect(assigns(:question)).to_not be_nil
      end

      it "assigns a newly created Question as @question" do
        post :create, question: {id: question.to_param}
        expect(assigns(:question)).to be_an_instance_of(Question)
      end

      it "redirects to the created Question" do
        post :create, question: {id: question.to_param}
        expect(response.status).to eq(302)
      end

    end

    # context "when invalid params are passed" do
    #   it "assigns a newly created but unsaved questions as @question" do
    #     expect {
    #       post :create, question: {id: question.to_param}
    #     }.to change{Question.count}
    #   end

    #   it "re-renders the 'new' template" do
    #     expect {
    #       post :create, question: {id: question.to_param}
    #     }.to change { Question.count }
    #     # expect(response.status).to render_template(:new)
    #   end
    # end
  end

  # describe "PUT update" do
  #   before :each do
  #     @question = FactoryGirl.build(:question)
  #   end

  #   context "when valid params are passed" do
  #     it "assigns the requested question as @question" do
  #       put :update, id: @question, question: {title: "MyString", content: "MyText", vote_count: 1, user_id: 1}
  #       assigns(:question).should eq(@question)
  #     end

  #     it "changes @question's attributes" do
  #       put :update, id: @question, question: {title: "MyTitle", content: "MyContent", vote_count: 1, user_id: 1}
  #       @question.reload
  #       @question.title.should eq("MyTitle")
  #       @question.content.should eq("MyContent")
  #       @question.vote_count.should eq(1)
  #       @question.user_id.should eq(1)
  #     end

  #     it "redirects to the updated question" do
  #       put :update, id: @question, question: {title: "MyTitle", content: "MyContent", vote_count: 1, user_id: 1}
  #       response.should redirect_to @question
  #     end
  #   end

  #   context "when invalid params are passed" do
  #     it "assigns the requested question as @question" do
  #       put :update, id: @question.id
  #       assigns(:question).should eq(@question)
  #     end

  #     it "changes @question's attributes" do
  #       put :update, id: @question.id
  #       @question.reload
  #       @question.title.should eq("Does Travis have a Cheeseburger?")
  #       @question.content.should eq("Does Travis haz cheezburger")
  #       @question.vote_count.should eq(0)
  #       @question.user_id.should eq(1)
  #     end

  #     it "re-renders the edit method" do
  #       put :update, id: @question.id
  #       response.should render_template :edit
  #     end
  #   end

  # end


  describe "DELETE #destroy" do
    let(:user) {User.create!(username: "Babe", email: "user@gmail.com", password: "password")}


    it "destroys the requested question" do
      delete_question = Question.create!(title: "Does it work?", content: "Why doesn't this thing work", vote_count: 2, user_id: user.id)
      question_count = Question.count
      delete :destroy, {id: delete_question.to_param} 
      expect(question_count).to be > Question.count
    end

    it "redirects to the questions list" do
      delete_question = Question.create!(title: "Does it work?", content: "Why doesn't this thing work", vote_count: 2, user_id: user.id)
      delete :destroy, {id: delete_question.to_param }
      expect(response).to be_redirect
    end
  end
end

