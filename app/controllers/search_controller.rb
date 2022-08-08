class SearchController < ApplicationController
  BGG_SEARCH_TYPES =  %w( boardgame boardgameaccessory boardgameexpansion rpgitem videogame )

  def index
    @query = params[:query]
    @type = params[:type]
    @bgg_types = BGG_SEARCH_TYPES
    @results = []

    if @query.present?
      url = "https://boardgamegeek.com/xmlapi2/search?query=#{CGI.escape(@query)}&type=#{@type}"
      response = HTTP.get(url)
      @results = Nokogiri.XML(response.to_s).xpath("//items/item").map do |item|
        Thing.new(id: item.attribute("id").value,
                  name: item.at_xpath(".//name/@value").value,
                  year: item.at_xpath(".//yearpublished/@value")&.value)
      end
    end
  end
end
