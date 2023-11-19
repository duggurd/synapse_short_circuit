module ProjectsHelper
    def stage_to_text(stage)
        stages = ["dropped", "research", "alpha", "beta", "released"]
        return stages[stage]
    end
end
