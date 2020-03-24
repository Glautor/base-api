# AUTHENTICATION

This project is an API for authenticating

## Dependencies

* JWT

* Devise

* Ruby

## Step by Step

`rails new authentication -d postgresql --api`

Add the follow gems in your Gemfile
gem 'bcrypt', '~> 3.1.7'
gem 'jwt', '~> 2.2.1'

Add this gem to development and test groups
gem 'rspec-rails', '~> 3.9'

Delete the test folder and run bundle install

After this, run:
`rails generate rspec:install`

Then, run:
`rails g model User name:string password:string`

Go to app/models/user.rb and paste the follow code
`
class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_secure_password
    validates_confirmation_of :password
end
`

If you check inside your spec folder on your root directory, you'll see the folder models with the user.rb file inside, get in this file and paste the follow code to test our model

`
require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid if the name is present" do
    expect(User.new(name:'Glauton', password:'teste123')).to be_valid
  end

  it "is valid if the name is uniqueness" do
    expect(User.new(name:'Natasha', password:'teste124')).to be_valid
  end

  it "is not valid if the name is not uniqueness" do
    User.create(name:'Glauton', password:'teste1235')
    expect(User.new(name:'Glauton', password:'teste1234')).to_not be_valid
  end

  it "is not valid without a name" do
    expect(User.new(password:'teste123')).to_not be_valid
  end
end
`

` rails g controller Api::V1::Authentication`

`rails g model Comment content:string`


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
