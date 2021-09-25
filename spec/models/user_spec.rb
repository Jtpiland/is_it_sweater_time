require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'Creation' do
    it 'can create/register a new user' do
      user = User.create( email: 'funbucket@gmail.com',
                          password: 'password',
                          password_confirmation: 'password')
      expect(user).to be_an_instance_of(User)
      expect(User.all.length).to eq(1)
    end
  end
end
