require 'rails_helper'

RSpec.describe TweetsFetchJob, :type => :job do
  it "creates two tweets" do
    expect {TweetsFetchJob.perform_later}.to change{Tweet.count}.from(0).to(2)
  end

  it "creates at least one user" do
    expect {TweetsFetchJob.perform_later}.to change{User.count}
  end
end
