class RoomsController < ApplicationController
  PER_PAGE = 10

  before_filter :require_authentication,
    :only => [:new, :edit, :create, :update, :destroy]

  def index
    @rooms = Room.most_recent
  end

  def show
    @room = Room.find(params[:id])
    
    if user_signed_in?
      @user_review = @room.reviews.find_or_initialize_by_user_id(current_user.id)
    end
  end

  def new
    @room = current_user.rooms.build
  end

  def edit
    @room = current_user.rooms.find(params[:id])
  end

  def create
    @room = current_user.rooms.build(params[:room])

    if @room.save
      redirect_to @room, :notice => t('flash.notice.room_created')
    else
      render action: "new"
    end
  end

  def update
    @room = current_user.rooms.find(params[:id])

    if @room.update_attributes(params[:room])
      redirect_to @room, :notice => t('flash.notice.room_updated')
    else
      render :action => "edit"
    end
  end

  def destroy
    @room = current_user.rooms.find(params[:id])
    @room.destroy

    redirect_to rooms_url
  end
end