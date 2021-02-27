class RehearsalsController < ApplicationController
  def index
    @my_upcoming_rehearsals = current_user.upcoming_rehearsals

    instrument_array = current_user.instruments.pluck(:id)
    @suggested_rehearsals = Rehearsal.upcoming.has_space_for(instrument_array) - @my_upcoming_rehearsals
  end
end
