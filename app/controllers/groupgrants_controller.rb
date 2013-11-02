class GroupgrantsController < ApplicationController
  before_action :set_groupgrant, only: [:show, :edit, :update, :destroy]

  # GET /groupgrants
  # GET /groupgrants.json
  def index
    @groupgrants = Groupgrant.all
    
  end

  # GET /groupgrants/1
  # GET /groupgrants/1.json
  def show
  end

  # GET /groupgrants/new
  def new
    @groupgrant = Groupgrant.new
  end

  # GET /groupgrants/1/edit
  def edit
  end

  # POST /groupgrants
  # POST /groupgrants.json
  def create
    @groupgrant = Groupgrant.new(groupgrant_params)
    @groupgrant.owner_id   = current_user.user.id
    @groupgrant.partner_id = 0
    respond_to do |format|
      if @groupgrant.save
        format.html { redirect_to @groupgrant, notice: 'Groupgrant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @groupgrant }
      else
        format.html { render action: 'new' }
        format.json { render json: @groupgrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupgrants/1
  # PATCH/PUT /groupgrants/1.json
  def update
    respond_to do |format|
      if @groupgrant.update(groupgrant_params)
        format.html { redirect_to @groupgrant, notice: 'Groupgrant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @groupgrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupgrants/1
  # DELETE /groupgrants/1.json
  def destroy
    @groupgrant.destroy
    respond_to do |format|
      format.html { redirect_to groupgrants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupgrant
      @groupgrant = Groupgrant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupgrant_params
      params.require(:groupgrant).permit(:name, :description, :goal_date, :goal_amount, :owner_id, :partner_id, :completed_date, :is_complete, :is_enabled, :video_url)
    end
end
