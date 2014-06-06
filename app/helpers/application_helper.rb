module ApplicationHelper
  def shorten(text, limit, ending = "...")
    if text.size > limit
      text.first(limit-ending.length) << ending
    else
      text
    end
  end
end
