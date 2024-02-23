module Api
  class CharactersController < ApplicationController
    def random_speech
      character = Character.find(params[:id])
      random_speech = character.random_speeches.order("RANDOM()").first
      render json: { speech: random_speech.alcohol_speeches }
    end
  end
end