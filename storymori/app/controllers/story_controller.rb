class StoryController < ActionController::API

  def index
    pages = Page.where(parent_id: nil)
    pages_decorated = pages.map do |page|
      { id: page.id, title: page.name, parentId: page.id}
    end
    render :json => pages_decorated
  end

  def create
    ActiveRecord::Base.transaction do
      @story = Story.create!(
        title: params[:title], 
        summary: params[:text].slice(0, 10)
      )
      @page = Page.create!(
        name: params[:title],
        text: params[:text],
        story_id: @story.id,
        parent_id: nil
      )
    end
    render :json => { storyId: @story.id, pageId: @page.id }
  rescue ActiveRecord::RecordInvalid => invalid
    puts invalid.record.errors
  end

end