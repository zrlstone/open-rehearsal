class RolesController < ApplicationController
  before_action :set_role, only: [:edit, :update, :destroy]
  # before_action :find_rehearsal, only: [:new, :create]

  # def new
  #   # only used for organiser role
  #   @role = Role.new
  #   @instruments = current_user.instruments
  # end

  # def create
  #   # only used for organiser role
  #   @role = Role.new(role_params)
  #   @role.rehearsal = @rehearsal
  #   if @role.save
  #     redirect_to add_roles_rehearsal_path(@rehearsal)
  #   else
  #     render :new
  #   end
  # end

  def edit
    # only used for organiser role
    @instruments = current_user.instruments
    @rehearsal = @role.rehearsal
  end

  def update
    # only used for organiser role
    if @role.update(role_params)
      @rehearsal = @role.rehearsal
      redirect_to add_roles_rehearsal_path(@rehearsal)
    else
      render :edit
    end
  end

  def accept_request
    @request = Request.find(params[:id])
    role = @request.role
    user = @request.user
    rehearsal = role.rehearsal
    role.update(user: user)

    redirect_to rehearsal_path(rehearsal)
  end

  def destroy
    @rehearsal = @role.rehearsal
    @role.destroy
    redirect_to add_roles_rehearsal_path(@rehearsal, anchor: "rehearsal-lineup")
  end

  private

  def role_params
    params.require(:role).permit(:user_id, :instrument_id, :rehearsal_id)
  end

  def set_role
    @role = Role.find(params[:id])
  end

  def find_rehearsal
    @rehearsal = Rehearsal.find(params[:rehearsal_id])
  end
end
