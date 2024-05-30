# spec/models/bookmark_spec.rb
require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  it "is valid with valid attributes" do
    movie = Movie.create(title: "Test", overview: "Test overview", poster_url: "http://test.com", rating: 5.0)
    list = List.create(name: "Test List")
    expect(Bookmark.new(comment: "Test comment", movie: movie, list: list)).to be_valid
  end

  it "is not valid without a comment" do
    expect(Bookmark.new).to_not be_valid
  end
end
