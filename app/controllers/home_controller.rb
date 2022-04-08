class HomeController < ApplicationController
  def index
    require 'uri'
    require 'net/http'
    require 'json'

    @url = 'https://pro-api.coinmarketcap.com/v2/tools/price-conversion'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)

    @my_coins = ["BTC", "XRP", "ADA", "XLM", "STEEM"]
  end

  def about
  end

  def lookup
    require 'uri'
    require 'net/http'
    require 'json'

    @url = 'https://pro-api.coinmarketcap.com/v2/tools/price-conversion'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coin = JSON.parse(@response)

    @symbol = params[:sym]


    if @symbol
      @symbol = @symbol.upcase
    end

    if @symbol == ""
      @symbol = 'Hey you forgot to enter a currency!'
    end
  end
end
