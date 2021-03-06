class RequestsController < ApplicationController
  def index
    @current_user_requests = current_user.requests
    @rehearsal = Rehearsal.all
    @incoming_requests = Request.joins(role: :rehearsal).where( roles: { user_id: nil }, rehearsals: { user_id: current_user.id } )
    @test = @incoming_requests

  end

  def create
    @request = Request.new
    @request.user = current_user
    @role = Role.find(params[:role_id])
    @request.role = @role
    @request.save
  end
end
