require './lib/tweets_fetch_job_error'

class TweetsFetchJob < ActiveJob::Base
  queue_as :default

  around_perform do |job, block|
    # do something before perform
    block.call
    # do something after perform
  end

  # We can eventually rescue from more errors
  rescue_from(JSON::ParserError) do |exception|
    raise TweetsFetchJobError::InvalidResponse
  end

  def perform(*args)
    response = Typhoeus.get('http://adaptive-test-api.herokuapp.com/tweets.json') # hardcoded for the time being
    data = JSON.parse(response.body)

    raise TweetsFetchJobError::InvalidResponse unless response.success?

    data.each {|t|
      tweet = Tweet.new(
        message: t['message'].to_s,
        sentiment: t['sentiment'],
        remote_id: t['id']
      )

      user = User.find_by(handle: t['user_handle'])

      if user.nil?
        user = User.create!(handle: t['user_handle'], followers: t['followers'])
      end

      tweet.user = user
      tweet.save!
    }
  end
end
