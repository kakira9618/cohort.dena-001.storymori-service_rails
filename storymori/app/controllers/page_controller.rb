class PageController < ActionController::API
  def show
    render :json => {}
  end
  def create
    render :json => { result: "ok" }
  end
end