class StoryController < ApplicationController
  protect_from_forgery except: :create # searchアクションを除外
  def index
    render :json => []
  end
  def create
    render :json => { result: "ok" }
  end
end