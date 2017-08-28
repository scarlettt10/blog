class PagesController < ApplicationController
 #this is responsible for showing all pages
  def index
    #local var only available in local method
    # if we want our view to have access to the var
    # we need an instance variable
    @pages = Page.all
    # render :index
  end

  #responsible for showing a specific page
  def show
    
    @page = Page.find(params[:id])
    #render :show - app/views/pages/show.html.erb
  end

  #responsible for showing a form to edit an existing page
  def edit
    @page = Page.find(params[:id])
    #render :edit - app/views/pages/edit.html.erb
  end

  #responsible for updating the values of pre-existing record
  def update
    @page = Page.find(params[:id])
      if @page.update(page_params)
        redirect_to page_path(@page)
      else
        render :edit
      end
  end

  #responsible for showing a form to create a new page
  def new
    @page = Page.new
    #render :new - app/views/pages/new.html.erb
  end

  #respnsible for saving a new record in our database
  def create
    #strong params
    page = Page.create(page_params)
    if page.save
      redirect_to page_path(page)
    else
      render :new
    end
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    redirect_to pages_path
  end

  private
    def page_params
      params.require(:page).permit(:title, :author, :body, :private)
    end

end
