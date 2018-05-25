class FamilyGoalsController < ApplicationController

  def index
    @family_goals = FamilyGoal.order(:id).paginate(:page => params[:page], :per_page => 15)
  end

  # Metodo para poder hacer la importacion excel
  def import
    FamilyGoal.import(params[:file])
    redirect_to root_url, notice: "Family Goals importadas."
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_family_goal
      @family_goal = FamilyGoal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_goal_params
      params.require(:family_goal).permit(:id, :name, :code, :cargo, :area, :mundo)
    end
end