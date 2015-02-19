class ScoresController < ApplicationController
  before_action :set_scores, only: [:show, :runs, :oppositions, :results]

  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.group('name')
  end

  # GET /scores/1
  # GET /scores/1.json
  def show

  end

  def runs
    @series = @aggregation.by_runs_and_venue
    respond_to do |format|
      format.json
    end
  end

  def oppositions
    @series = @aggregation.by_runs_and_opposition
    respond_to do |format|
      format.json
    end
  end

  def results
    @series = @aggregation.by_runs_and_result
    respond_to do |format|
      format.json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scores
      @player_name = params[:id].split('-').collect(&:classify).join(' ')
      @aggregation = ScoresAggregator.new(Score.where(name: @player_name))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score)
    end
end