class UsersController < ApplicationController
  
  before_filter :load_user, :except => [:index, :new, :create]
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html do
          redirect_to @user, :notice => "User was successfully created."
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
      if @user.update_attributes(params[:user])
        format.html do
          redirect_to @user, :notice => "User was successfully updated."
        end
      else
        format.html do
          render "new"
        end
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html do
        redirect_to users_path, :notice => "User was successfully destroyed."
      end
    end
  end

  def enable
    respond_to do |format|
      if @user.update_attribute(:enable, true)
        format.html do
          redirect_to users_path, :notice => "User was successfully enabled."
        end
      else
        format.html do
          render "new"
        end
      end
    end
  end

  private

  def load_user
    if params[:id].present?
      @user = User.find(params[:id])
    else
      raise "No id present"
    end
  end
  
end
