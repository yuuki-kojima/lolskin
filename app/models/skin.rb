class Skin < ApplicationRecord
  belongs_to :champion
  self.inheritance_column = :_type_disabled

  def get_skin_meta
    agent = Mechanize.new
    page = agent.get('http://leagueoflegends.wikia.com/wiki/Skins')
    # elements = page.at('.stdt').search('tr')
    elements = page.search('tr')

    elements.shift

    num = 0

    loop{
      ele = elements[num]
      if ele.search('span')[8].present? && ele.search('td')[2].present?
        skin_name = ele.at('a').get_attribute(:title)
        skin_price = ele.search('span')[8].inner_text
        skin_release_date = ele.search('td')[2].inner_text
        skin_type = set_skin_type(skin_price.to_i)
        skin_price = "10gems" if skin_price == "10"

        skin = Skin.find_by_name(skin_name)
        pp skin
          if skin.present?
            skin.price = skin_price
            skin.type = skin_type
            skin.save
          end
      end

      num+=1

      if elements[num] == nil
        break
      end
    }

    # elements.each do |ele|
    #   skin_name = elements.at('a').get_attribute(:title)
    #   skin_price = elements.search('span')[8].inner_text
    #   skin_release_date = elements.search('td')[2].inner_text
    #   skin_type = set_skin_type(skin_price.to_i)
    #   skin_price = "10gems" if skin_price == "10"

    #   skin = Skin.find_by_name(skin_name)
    #   pp skin
    #     if skin.present?
    #       skin.price = skin_price
    #       skin.type = skin_type
    #       skin.save
    #     end
    # end

    # product = Product.where(title: title).first_or_initialize
    # product.image_url = image_url
    # product.director = director
    # product.detail = detail
    # product.open_date = open_date
    # product.save
  end

  def set_skin_type(price)
    skin_type = 'Classic' if price == 520 || price == 390
    skin_type = 'Budget' if price == 750
    skin_type = 'Standard' if price == 975
    skin_type = 'Epic' if price == 1350
    skin_type = 'Legendary' if price == 1820
    skin_type = 'Loot Exclusive' if price == 10
    skin_type = 'Ultimate' if price == 3250 || price == 2775
    return skin_type
  end

end
