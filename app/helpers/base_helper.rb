require "net/http"
module BaseHelper
    def stage_to_color(stage)
        colors = ["#888888","#497fd6", "#d649c6", "#d69f49", "#49d659"]
        return colors[stage]
    end

    def get_github_repos(username)
        net = Net::HTTP::new("api.github.com", 443)
        net.use_ssl=true
        resp = net.get("/users/#{username}/repos")
        p resp.body
    end

    def create_github_repo()
    end
end
