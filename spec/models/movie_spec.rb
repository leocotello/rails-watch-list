# spec/models/movie_spec.rb
require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "is valid with valid attributes" do
    expect(Movie.new(title: "Test", overview: "Test overview", poster_url: "http://test.com", rating: 5.0)).to be_valid
  end

  it "is not valid without a title" do
    expect(Movie.new(overview: "Test overview", poster_url: "http://test.com", rating: 5.0)).to_not be_valid
  end
end
