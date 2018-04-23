require 'net/http'

require 'rubygems'
require 'json'
class NukesController < ApplicationController

  def create

    @nuke = Nuke.create(params[:nuke])
    @game = @nuke.game
    @json_string= @nuke.json_data
   
    if @nuke.valid?
      data = @nuke.send_nuke_to_server("http://battle.platform45.com/nuke")
      p data

      @nuke.update_attributes(:status => data["status"])

      @server_nuke = Nuke.create(:game_id => @game.id, :server_nuke_boolean => true, :x =>Integer(data["x"]), :y => Integer(data["y"]))
      if data["sunk"]
        @server_ship = ServerShip.create(:name => data["sunk"], :sunk => true, :game_id => @game.id)
      end

      if data["game_status"]
        if data["game_status"] == "lost"
          @game.win_game!

            render :won_game

        else
          @game.lose_game
          render :lost_game 
        end
      end
      render :battle
    else
      render :template => "nukes/errors.js.erb"
    end
  end


end
