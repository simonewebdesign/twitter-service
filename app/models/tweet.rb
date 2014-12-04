class Tweet < ActiveRecord::Base
  belongs_to :user

  default_scope { order('sentiment DESC') }
end
