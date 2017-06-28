class BuildingsController < ApplicationController
  before_filter :login_required # User must be logged in first
  authorize_resource # Used by CanCan to restrict controller access


  def index
	@title = t("building.index_building")
	#if params[:user_id].blank?
	#	@buildings = Building.find_all_by_user_id(current_user.id)
	#else
		@buildings = Building.find_all_by_user_id(params[:user_id])
		#@buildings = Building.find_all_by_user_id(current_user.id)
	#end
  end

  def edit
	@title = t("building.edit_building") + params[:id].to_s
	@building = Building.find(params[:id])
  end

  def new
	@title = t("building.new_building")
	@building = Building.new
  end

  def create
    @title = t("building.index_building")

    @building = Building.new
    @building.attributes = params[:building]

    #if params[:building][:user_id].blank?
	#@building.user_id = current_user.id
   # else
	#@building.user_id = params[:building][:user_id]
#	params[:user_id] = params[:building][:user_id]
    #end

    respond_to do |format|
      if @building.save
	#if params[:building][:user_id].blank?
         # format.html { redirect_to action: "index", notice: 'Building was successfully created.' }
	#else
	  flash[:notice] = "Building was successfully created."
	  format.html { redirect_to user_buildings_path(:user_id => params[:building][:user_id]) }
	#end
      else
          format.html { redirect_to(:back)}
      end
    end


  end


  def update
	@building = Building.find(params[:id])

      respond_to do |format|
        if @building.update_attributes(params[:building])
	  @title = t("building.index_building")
          flash[:notice] = 'Building was successfully updated.'
	  #if params[:building][:user_id].blank?
	   #     format.html { redirect_to action: "index" }
	#	format.xml { head :ok }
	 # else
	  format.html { redirect_to user_buildings_path(:user_id => @building.user_id) }
	  #end
        else
	  @title = t("building.edit_building")
          format.html { render :action => "edit" }
          format.xml { render :xml => @building.errors, :status => :unprocessable_entity }
        end
      end

  end


  def destroy
    @building = Building.find(params[:id])
    @user_id = @building.user_id
    @building.destroy
    @title = t("building.index_building")
    respond_to do |format|
      format.html { redirect_to user_buildings_path(:user_id => @user_id) }
      format.xml { head :ok }
    end
  end


end
