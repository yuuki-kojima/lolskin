class ChampionsController < ApplicationController
  def index
    @champions = Champion.where('name LIKE(?)',"#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show_skins
    @champion = Champion.find_by(key: params[:key])
    @skins = @champion.skins
  end

  def show_skin
    @champion = Champion.find_by(key: params[:key])
    @skins = @champion.skins
    @skin = Skin.find_by(name: params[:skin_name])
  end

  def search
    @champion = Champion.find(params[:id])
    @skins = @champion.skins
    respond_to do |format|
      format.html
      format.json
    end
  end

end
