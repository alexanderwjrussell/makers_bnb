require 'spec_helper'

describe User do

  let!(:user) do
    User.create(email: 'me@me.com', password: '1', password_confirmation: '1', name: 'James')
  end

  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate with wrong password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end

  it 'does not authenticate with wrong email' do
    expect(User.authenticate('wrong@email.com', user.password)).to be_nil
  end

end
