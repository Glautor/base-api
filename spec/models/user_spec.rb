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
