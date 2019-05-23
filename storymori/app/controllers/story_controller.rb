class StoryController < ActionController::API
  def index
    render :json => []
  end
  def create
    render :json => { result: "ok" }
  end
end