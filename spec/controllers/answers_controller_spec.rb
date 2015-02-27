require 'rails_helper'

describe AnswersController do
  let!(:user) { User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: 'password')}
  let!(:question) { Question.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, vote_count: 5, user: user) }
  let!(:answer) { Answer.create!(content: Faker::Lorem.paragraph, vote_count: 20, user: user) }

  describe "GET #new" do
      it 'should generate a new instance of answer' do
      get :new, :question_id => question.id
        expect(assigns(:answer)).to be_an_instance_of(Answer)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "creates a new Answer" do
        expect{ post :create, {question_id: question.id, answer: {content: 'terrible solution, bro.'} } }.to change{Answer.count}.by(1)
      end

      it "assigns a newly created game as @answer" do
        post :create, {question_id: question.id, answer: {content: 'terrible solution, bro.'} }
        expect(assigns(:answer)).to be_an_instance_of(Answer)
      end

# Probably don't need a redirect since this will be ajax?
      it "redirects to the created game" do
        post :create, {question_id: question.id, answer: {content: 'terrible solution, bro'} }
        expect(response.status).to eq(302)
      end
    end
  end

  # describe "PUT #update" do
  #     it 'should update the content of an answer' do
  #   end
  # end

  describe "DELETE #destroy" do
    it "assigns the requested answer as @answer" do
      delete :destroy, {question_id: question.id, id: answer.to_param }
      expect(assigns(:answer)).to eq(answer)
    end

    it "destroys the requested answer" do
      expect {
        delete :destroy, question_id: question.id, id: answer.id
      }.to change(Answer, :count).by(-1)
    end
  end
end
