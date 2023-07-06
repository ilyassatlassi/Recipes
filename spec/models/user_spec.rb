require 'rails_helper'

describe User, type: :model do
  let(:name) { 'Simon' }
  let(:email) { 'simon@example.com' }
  let(:password) { '123456' }

  let(:test_user) { User.create(name: name, email: email, password: password) }


  it 'User model field should be equal to test user' do
    expect(test_user.name).to eq(name)
    expect(test_user.email).to eq(email)
    expect(test_user.password).to eq(password)
  end
end
