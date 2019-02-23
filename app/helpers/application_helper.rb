module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.png'
    end
  end

  def user_header_color(user)
    if user.header_color.present?
      user.header_color
    else
      '#005a55'
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end

def sklonenie(number, krokodil, krokodila, krokodilov)
  if number == nil || !number.is_a?(Numeric)
    number = 0
  end

  ostatok = number % 10

  if  (number % 100).between?(11, 14)
    return krokodilov
  end

  if ostatok == 1
    return krokodil
  end

  if ostatok >= 2 && ostatok <= 4
    return krokodila
  end

  if (ostatok >= 5 && ostatok <= 9) || ostatok == 0
    return krokodilov
  end
end
