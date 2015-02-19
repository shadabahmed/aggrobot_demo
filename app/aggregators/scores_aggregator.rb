class ScoresAggregator
  SCORE_BUCKETS = [0..10, 11..30, 31..50, 51..75, 76..100, 101..150, 151..200, 201..300]

  def initialize(scores)
    @scores = scores
  end

  def by_runs_and_venue
    Aggrobot.start(@scores, top_level_grouping(:venue))
  end

  def by_runs_and_result
    Aggrobot.start(@scores, top_level_grouping(:match_result))
  end

  def by_runs_and_opposition
    Aggrobot.start(@scores, top_level_grouping(:against))
  end

  private

  def top_level_grouping(grouping)
    Aggrobot.block do
      hash do
        group_by grouping
        each_group runs_grouping
      end
    end
  end

  def runs_grouping
    Aggrobot.block do
      list do
        group_by :score, buckets: SCORE_BUCKETS, keep_empty: true
        collect_each_group_attributes
      end
    end
  end
end