module TweetsHelper

  def highlighted?(message)
    return true if message =~ /(coke|coca-cola|diet cola)/i
    false
  end
end
