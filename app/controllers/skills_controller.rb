class SkillsController < ApplicationController
  before_action :set_skill, only: :destroy

  before_action :find_instrument, only: :create

  def create
    current_user.skills.create(instrument: @instrument)
    redirect_to edit_user_registration_path(user: current_user, anchor: "user-skills")
  end

  def destroy
    @skill.destroy
    redirect_to edit_user_registration_path(user: current_user, anchor: "user-skills")
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def find_instrument
    @instrument = Instrument.find(params[:instrument])
  end
end
