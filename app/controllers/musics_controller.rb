class MusicsController < ApplicationController
    def index
        @music = Music.all
        render json: @music
    end
end
