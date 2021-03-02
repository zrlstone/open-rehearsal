class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :show_piano

  def home
  end

  def show_piano
    @instrument = Instrument.find(114)
  end
end
