module TweetsHelper

  def highlighted?(message)
    return true if message =~ /(coke|coca-cola|diet cola)/i
    false
  end

  def sentiment_image_tag(score)
    case
    when score > 0
      image_tag 'sentiment/positive.png'
    when score < 0
      image_tag 'sentiment/negative.png'
    else
      image_tag 'sentiment/neutral.png'
    end
  end
end
