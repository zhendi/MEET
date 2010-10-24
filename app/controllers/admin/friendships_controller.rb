class Admin::FriendshipsController < ApplicationController
  # GET /admin/friendships
  # GET /admin/friendships.xml
  def index
    @friendships = Friendship.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /admin/friendships/1
  # GET /admin/friendships/1.xml
  def show
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /admin/friendships/new
  # GET /admin/friendships/new.xml
  def new
    @friendship = Friendship.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /admin/friendships/1/edit
  def edit
    @friendship = Friendship.find(params[:id])
  end

  # POST /admin/friendships
  # POST /admin/friendships.xml
  def create
    @friendship = Friendship.new(params[:admin_friendship])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to([:admin, @friendship], :notice => 'Friendship was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /admin/friendships/1
  # PUT /admin/friendships/1.xml
  def update
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      if @friendship.update_attributes(params[:admin_friendship])
        format.html { redirect_to([:admin, @friendship], :notice => 'Friendship was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /admin/friendships/1
  # DELETE /admin/friendships/1.xml
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to(admin_friendships_url) }
    end
  end
end
