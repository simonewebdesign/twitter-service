require 'rails_helper'

RSpec.describe Tweet, :type => :model do
  it "orders by sentiment descendant" do
    nice = Tweet.create!(sentiment: 1)
    cruel = Tweet.create!(sentiment: -0.5)

    expect(Tweet.all).to eq([nice, cruel])
  end
end
