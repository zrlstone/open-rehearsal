class RolesController < ApplicationController
  before_action :set_role, only: [:edit, :update, :destroy]

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

    @request.accepted = true
    @request.save
    role.update(user: user)

    delete_users_other_requests(user, rehearsal)
    reject_other_users(role)

    redirect_to requests_path
  end

  def destroy
    @rehearsal = @role.rehearsal
    @role.destroy
    redirect_to add_roles_rehearsal_path(@rehearsal, anchor: "final-step")
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

  def delete_users_other_requests(user, rehearsal)
    user.requests.each do |request|
      if request.role.rehearsal == rehearsal && !request.accepted
        request.destroy
      end
    end
  end

  def reject_other_users(role)
    role.requests.each do |request|
      if !request.accepted
        request.accepted = false
        request.save
      end
    end
  end
end
