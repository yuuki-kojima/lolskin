class AdminsController < ApplicationController

  API_KEY = 'RGAPI-cce382f7-f2c3-446c-8dc8-f96b70cf4c3e'

  def index
  end

  def input_data
    region = "jp"
    uri = URI.parse("https://jp1.api.riotgames.com/lol/static-data/v3/champions?locale=en_US&champListData=skins&tags=skins&dataById=true&api_key=#{API_KEY}")

    return_data = Net::HTTP.get(uri)
    json = JSON.parse(return_data)
    champion_data = json["data"]

    champion_data.each do |champion|
      new_champion = Champion.where(name: champion[1]["name"]).first_or_initialize
      new_champion[:key] = champion[1]["key"]
      new_champion.save
      skins = champion[1]["skins"]
      skins.each do |skin|
        new_skin = new_champion.skins.find_by(name: skin["name"])
        if new_skin.nil?
          new_skin = new_champion.skins.new
          new_skin[:name] = skin["name"]
          new_skin[:skin_num] = skin["num"]
          new_skin[:skin_id] = skin["id"]
          new_skin.save
        end
        # new_skin = new_champion.skins.where(name: skin["name"]).first_or_initialize
        # new_skin[:skin_num] = skin["num"]
        # new_skin[:skin_id] = skin["id"]
        # new_skin.save
      end
    end
  end

  def input_skin

  end

end
