require 'rails_helper'

RSpec.describe User do

  describe 'Model Associations' do
    it 'should have many development plans' do
      should have_many(:development_plans)
    end

    it 'should have many development skills' do 
      should have_many(:development_skills)
    end
  end

  describe 'Database Validation' do

    it 'should validate presence of email' do
      validate_presence_of(:email)
    end

    it 'should validate presence of password' do
      validate_presence_of(:password)
    end

# Devise Testing - checks for validity on save
    # Must match regex for emails
    it 'should contain a valid email' do
      user = User.new(:email => 'invalidemailaddress', 
              :password => 'password')
      expect(user.save).to be false
    end

    # Password is invalid with under 8 characters
    it 'should contain a valid password' do
      user = User.new(:email => 'valid@email.com', 
              :password => 'seven#s')
      expect(user.save).to be false
    end
    it 'should save with valid email and password' do
      user = User.new(:email => 'valid@email.com', 
              :password => 'ValidPassword22', 
              :confirmed_at => Date.today) # Adding pre-confirmation for simplicity
      expect(user.save).to be true
    end
  end
end
