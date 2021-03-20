class RehearsalsController < ApplicationController
  before_action :set_rehearsal, only: [:show, :edit, :update, :destroy, :add_roles, :build_role]

  def index
    @my_upcoming_rehearsals = current_user.upcoming_rehearsals

    instrument_array = current_user.instruments.pluck(:id)
    @suggested_rehearsals = Rehearsal.upcoming.has_space_for(instrument_array).uniq - @my_upcoming_rehearsals
    if params[:query].present?
      @suggested_rehearsals = Rehearsal.search_by_title_and_address(params[:query]).upcoming.has_space_for(instrument_array).uniq - @my_upcoming_rehearsals
    end

    @markers = @suggested_rehearsals.map do |rehearsal|
      if rehearsal.geocoded?
        {
          lat: rehearsal.latitude,
          lng: rehearsal.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { rehearsal: rehearsal }),
          image_url: helpers.asset_url('music-icon3.png')
        }
      end
    end
  end

  def show
    @organiser = @rehearsal.organiser
    @spaces = @rehearsal.roles.vacant
    @filled = @rehearsal.roles.filled
    @roles_requested_by_user = current_user.requests.map { |request| request.role }

    @marker =
      [{
        lat: @rehearsal.latitude,
        lng: @rehearsal.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { rehearsal: @rehearsal }),
        image_url: helpers.asset_url('music-icon3.png')
      }]
  end

  def new
    @rehearsal = Rehearsal.new
    @instruments = current_user.instruments
    @rehearsal.roles.build
  end

  def create
    @rehearsal = Rehearsal.new(rehearsal_params)
    @rehearsal.organiser = current_user
    if @rehearsal.save
      redirect_to add_roles_rehearsal_path(@rehearsal)
    else
      @instruments = current_user.instruments
      render :new, instruments: @instruments
    end
  end

  def add_roles
    @instruments = Instrument.all
  end

  def build_role
    @role = Role.new
    @role.instrument_id = params[:instrument]
    @role.rehearsal = @rehearsal
    if @role.save
      redirect_to add_roles_rehearsal_path(@rehearsal, anchor: "final-step")
    end
  end

  def edit
    @instruments = current_user.instruments
  end

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
    params.require(:rehearsal)
          .permit(:date_time,
                  :address,
                  :title,
                  :description,
                  roles_attributes: [:id, :rehearsal_id, :instrument_id, :user_id])
  end

  def set_rehearsal
    @rehearsal = Rehearsal.find(params[:id])
  end
end
