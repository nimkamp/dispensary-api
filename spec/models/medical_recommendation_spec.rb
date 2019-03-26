require 'rails_helper'

RSpec.describe MedicalRecommendation, type: :model do
  subject { described_class.new }
  it "is a valid expiration date" do
    expect(MedicalRecommendation.new(user_id:4, number: 7, issuer:"Nick", state:"CA", expiration_date: "@20260620}", image:"pathtofile")).to be_valid
  end

  it "is not a valid expiration date" do
    expect(MedicalRecommendation.new(user_id:4, number: 7, issuer:"Nick", state:"CA", expiration_date: "@19920620}", image:"pathtofile")).to_not be_valid
  end

  it "is not a valid expiration date" do
    expect(MedicalRecommendation.new(user_id:4, number: 6, issuer:"Nick", state:"CA", expiration_date: "@19470727}", image:"pathtofile")).to_not be_valid
  end

  it "is a valid expiration date" do
    expect(MedicalRecommendation.new(user_id:4, number: 8, issuer:"Nick", state:"CA", expiration_date: "@20820612}", image:"pathtofile")).to be_valid
  end
end
