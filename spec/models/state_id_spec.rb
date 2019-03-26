require 'rails_helper'

RSpec.describe StateId, type: :model do
  subject { described_class.new }
  it "is a valid expiration date" do
    expect(StateId.new(user_id:4, number: 7, state:"CA", expiration_date: "@20260620}", image:"pathtofile")).to be_valid
  end

  it "is not a valid expiration date" do
    expect(StateId.new(user_id:4, number: 7, state:"CA", expiration_date: "@19920620}", image:"pathtofile")).to_not be_valid
  end

  it "is not a valid expiration date" do
    expect(StateId.new(user_id:4, number: 6, state:"CA", expiration_date: "@19470727}", image:"pathtofile")).to_not be_valid
  end

  it "is a valid expiration date" do
    expect(StateId.new(user_id:4, number: 8, state:"CA", expiration_date: "@20820612}", image:"pathtofile")).to be_valid
  end
end