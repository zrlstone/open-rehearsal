class RequestsController < ApplicationController
  def index
    @current_user_requests = current_user.requests
    @rehearsal = Rehearsal.all
    @incoming_requests = Request.joins(role: :rehearsal).where( roles: { user_id: nil }, rehearsals: { user_id: current_user.id } )
    @test = @incoming_requests

    respond_to do |format|
      format.html
      format.json { render json: { incoming_requests: @incoming_requests } }
    end
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
