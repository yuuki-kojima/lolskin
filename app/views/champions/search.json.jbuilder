json.array! @skins do |skin|
  json.id    skin.id
  json.num   skin.skin_num
  json.name  skin.name
  json.champion_name  @champion.name
  json.champion_key  @champion.key
end

