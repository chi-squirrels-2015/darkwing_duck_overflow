require 'rails_helper'

describe AnswersController do
  let!(:question) { Question.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, vote_count: 5, user_id: 2) }
  let!(:answer) { Answer.create!(content: Faker::Lorem.paragraph, vote_count: 20, user_id: 1, question_id: 5) }

  describe "GET #index" do
    it "assigns all answers as @answers" do
      get :index
      expect(assigns(:answers)).to eq(Answer.all)
      # Hint: You can gain access to any instance variable in your
      # controller with assigns(:ivar_name). Don't forget to make
      # a request!
    end
  end

  describe "GET #show" do
    it "assigns the requested answer as @answer" do
      get :show, { id: answer.to_param }
      expect(assigns(:answer)).to eq(answer)
    end
  end

  describe "GET #new" do
      it 'should generate a new instance of answer' do

      get :new
      expect(assigns(:answer)).to be_an_instance_of(Answer)
    end
  end

  describe "POST create" do
    context "when valid params are passed" do
      it "creates a new Answer" do
        expect{ post :create, {answer: {content: 'terrible solution, bro.'} } }.to change{Answer.count}.by(1)
      end

      it "assigns a newly created game as @answer" do
        post :create, {answer: {content: 'terrible solution, bro.'} }
        expect(assigns(:answer)).to be_an_instance_of(Answer)
      end

# Probably don't need a redirect since this will be ajax?
      it "redirects to the created game" do
        post :create, {answer: {content: 'terrible solution, bro'} }
        expect(response.status).to eq(302)
      end
    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested answer as @answer" do
      delete :destroy, { id: answer.to_param }
      expect(assigns(:answer)).to eq(answer)
    end

    it "destroys the requested answer" do
      expect {
        delete :destroy, id: answer.id
      }.to change(Answer, :count).by(-1)
    end
  end
end
