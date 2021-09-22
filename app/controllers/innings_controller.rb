class InningsController < ApplicationController
  def index
    @innings = Inning.all
    @repeats = inning_repeats.to_json
    @on_leave = inning_leave.to_json
    @dismissed = inning_dismissed.to_json
  end

  def inning_repeats
    @innings.map do |inning|
      inning.repeated
    end
  end
  def inning_leave
    @innings.map do |inning|
      inning.currently_on_leave
    end
  end
  def inning_dismissed
    @innings.map do |inning|
      inning.dismissed
    end
  end
end
