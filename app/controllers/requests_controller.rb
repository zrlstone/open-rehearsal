class RequestsController < ApplicationController
  def index
    @current_user_requests = current_user.requests
    @current_user_rehearsals = current_user.rehearsals
    @rehearsal = Rehearsal.all
    @incoming_requests = Request.joins(role: :rehearsal).where(requests: { accepted: nil }, roles: { user_id: nil }, rehearsals: { user_id: current_user.id })
  end

  def create
    @request = Request.new
    @request.user = current_user
    @role = Role.find(params[:role_id])
    @rehearsal = @role.rehearsal
    @request.role = @role
    redirect_to rehearsal_path(@rehearsal) if @request.save
  end
end
