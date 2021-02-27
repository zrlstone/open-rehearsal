class RehearsalsController < ApplicationController
  before_action :set_rehearsal, only: [:show, :edit, :update, :destroy]
  def index
    @my_upcoming_rehearsals = current_user.upcoming_rehearsals

    instrument_array = current_user.instruments.pluck(:id)
    @suggested_rehearsals = Rehearsal.upcoming.has_space_for(instrument_array).uniq - @my_upcoming_rehearsals
  end

  def show
  end

  def new
    @rehearsal = Rehearsal.new
  end

  def create
    @rehearsal = Rehearsal.new(rehearsal_params)
    @rehearsal.organiser = current_user
    if @rehearsal.save!
      redirect_to rehearsal_path(@rehearsal)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @rehearsal.update(rehearsal_params)
      redirect_to rehearsal_path(@rehearsal)
    else
      render :edit
    end
  end

  def destroy
    @rehearsal.destroy
    redirect_to rehearsals_path
  end

  private

  def rehearsal_params
    params.require(:rehearsal).permit(:date_time, :address, :title, :description)
  end

  def set_rehearsal
    @rehearsal = Rehearsal.find(params[:id])
  end
end
