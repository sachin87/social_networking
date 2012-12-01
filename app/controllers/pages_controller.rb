class PagesController < ApplicationController

  before_filter :load_page, :except => [:index, :new, :create]

  def index
    @pages = Page.all
  end

  def show   
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    respond_to do |format|
      if @page.save
        format.html do
          redirect_to @page, :notice => "Page was successfully created."
        end
      else
        format.html do
          render "new"
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html do
          redirect_to @page, :notice => "Page was successfully updated."
        end
      else
        format.html do
          render "new"
        end
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html do
        redirect_to pages_path, :notice => "Page was successfully destroyed."
      end
    end
  end

  private

  def load_page
    if params[:id].present?
      @page = Page.find(params[:id])
    else
      raise "No id present"
    end
  end

end