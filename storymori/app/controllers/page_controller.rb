class PageController < ApplicationController
  protect_from_forgery except: :create # for postman test
  def show
    render :json => {}
  end
  def create
    render :json => { result: "ok" }
  end
end