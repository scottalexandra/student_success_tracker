class InningsController < ApplicationController
  def index
    @innings = Inning.all
  end
end
