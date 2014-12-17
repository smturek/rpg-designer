class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.save
    redirect_to skills_path
  end

  def destroy
    set_skill
    @skill.destroy
    redirect_to skills_path
  end

  def update
    set_skill
    @skill.update(skill_params)
    redirect_to skills_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :cost)
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end

end
