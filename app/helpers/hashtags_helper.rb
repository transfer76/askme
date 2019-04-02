module HashtagsHelper
  def add_hashtag_links(s)
    result =
      s.gsub(Hashtag::REGEXP) do |name|
        link_to name, hashtag_url(name.delete("#"))
      end
    
    result.html_safe
  end
end
