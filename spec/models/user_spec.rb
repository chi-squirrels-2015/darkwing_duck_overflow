require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:user) { User.new }

  context 'validations' do
    context 'email' do
      it 'should not allow a non-unique email' do
        user1 = User.new(email:"fake@fake.com", password: "fakefake")
        user1.save!
        user2 = User.new(email:"fake@fake.com", password: "fakefake")
        user2.save
        expect(user2.errors[:email]).to_not be_empty
      end

      it 'should not allow a non properly formatted email' do
        user.email = "fakeandbreakthings42"
        user.save
        expect(user.errors.messages[:email].length).to eq(1)
      end

      it 'should accept a properly formatted, unique email' do
        user.email = "fake@working.org"
        user.save
        expect(user.errors[:email]).to be_empty
      end
    end

    context 'password' do
      it 'should not accept a password with fewer than 8 characters' do
        user.password = "break"
        user.save
        expect(user.errors[:password]).to_not be_empty
      end

      it 'should not allow password to be blank' do
        user.password = ""
        user.save
        expect(user.errors[:password]).to_not be_empty
      end

      it 'should accept a password of 8 or more characters' do
        user.password = "working1"
        user.save
        expect(user.errors[:password]).to be_empty
      end
    end
  end
end
