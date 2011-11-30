require 'net/http'

require 'rubygems'
require 'json'
class NukesController < InheritedResources::Base

  def create
    @nuke = Nuke.create(params[:nuke])
    @game = @nuke.game
    @json_string= @nuke.json_data

    if @nuke.valid?
      uri = URI.parse("http://battle.platform45.com/nuke")

      request = Net::HTTP::Post.new(uri.request_uri,  initheader = {'Content-Type' =>'application/json'})
      request.body = @json_string
      response = Net::HTTP.new(uri.host, uri.port).start {|http| http.request(request) }

      data = ActiveSupport::JSON.decode(response.body)
      p data

      @nuke.update_attributes(:status => data["status"])

      @server_nuke = Nuke.create(:game_id => @game.id, :server_nuke_boolean => true, :x =>Integer(data["x"]), :y => Integer(data["y"]))

      render :battle
    else
      render :template => "nukes/errors.js.erb"
    end
  end


end
