# Provides useful error messages for TweetsFetchJob
module TweetsFetchJobError

  class InvalidResponse < StandardError
    def message
      "We got an invalid response from the server. Please try again"
    end
  end
end
