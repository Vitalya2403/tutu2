class SearchesController < ApplicationController
  def show
    @station = RailwayStation.all
  end
end