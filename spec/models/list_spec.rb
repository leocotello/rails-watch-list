# spec/models/list_spec.rb
require 'rails_helper'

RSpec.describe List, type: :model do
  it "is valid with valid attributes" do
    expect(List.new(name: "Test List")).to be_valid
  end

  it "is not valid without a name" do
    expect(List.new).to_not be_valid
  end
end
