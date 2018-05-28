class ChampionsController < ApplicationController
  def index
    @champions = Champion.where('name LIKE(?)',"#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
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
