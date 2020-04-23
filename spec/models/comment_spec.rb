require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Glauton', email: 'glautorgcs@gmail.com', password: 'test123', password_confirmation: 'test123') }

  context 'is valid if' do
    it 'the content is present' do
      expect(Comment.new(content: 'This is my comment', user: user)).to be_valid
    end
  end

  context 'is not valid if' do
    it 'the content is not present' do
      expect(Comment.new(user: user)).to_not be_valid
    end

    it 'the user is not present' do
      expect(Comment.new(content: 'thi is my new comment')).to_not be_valid
    end
  end
end
