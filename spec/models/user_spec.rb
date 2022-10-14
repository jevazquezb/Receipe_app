require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      name: 'Jesus',
      email: 'jesus@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )
    @user.skip_confirmation!
    @user.save!
  end

  context 'User Model Properties' do
    it 'name should be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'email should be present' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'password should be present' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'name should be unique' do
      @duplicate_user = User.new(
        name: 'Jesus',
        email: 'jesus@email.com',
        password: '112233',
        password_confirmation: '112233',
        confirmed_at: Time.now
      )
      @duplicate_user.skip_confirmation!
      expect(@duplicate_user).to_not be_valid
    end
  end
end
