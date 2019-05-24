class PageController < ActionController::API
  def show
    page = Page.find_by id: params[:page_id], story_id: params[:story_id]

    if page.nil? 
      render :json => { message: "page not found." }, :status => 404
    else
      render :json => { 
        id: page.id, 
        name: page.name, 
        text: page.text, 
        children: page.children.map do |child| 
          { id: child.id, name: child.name }
        end 
      } 
    end
  end

  def create
    ActiveRecord::Base.transaction do
      @page = Page.create!(
        name: params[:name],
        text: params[:text],
        story_id: params[:story_id],
        parent_id: params[:parent_id]
      )
    end
    render :json => { id: @page.id }
  rescue ActiveRecord::RecordInvalid => invalid
    puts invalid.record.errors
  end
end