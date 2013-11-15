class GroupgrantCategoriesController < ApplicationController
  before_action :set_groupgrant_category, only: [:show, :edit, :update, :destroy]

  # GET /groupgrant_categories
  # GET /groupgrant_categories.json
  def index
    @groupgrant_categories = GroupgrantCategory.all
  end

  # GET /groupgrant_categories/1
  # GET /groupgrant_categories/1.json
  def show
  end

  # GET /groupgrant_categories/new
  def new
    @groupgrant_category = GroupgrantCategory.new
  end

  # GET /groupgrant_categories/1/edit
  def edit
  end

  # POST /groupgrant_categories
  # POST /groupgrant_categories.json
  def create
    @groupgrant_category = GroupgrantCategory.new(groupgrant_category_params)

    respond_to do |format|
      if @groupgrant_category.save
        format.html { redirect_to @groupgrant_category, notice: 'Groupgrant category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @groupgrant_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @groupgrant_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupgrant_categories/1
  # PATCH/PUT /groupgrant_categories/1.json
  def update
    respond_to do |format|
      if @groupgrant_category.update(groupgrant_category_params)
        format.html { redirect_to @groupgrant_category, notice: 'Groupgrant category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @groupgrant_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupgrant_categories/1
  # DELETE /groupgrant_categories/1.json
  def destroy
    @groupgrant_category.destroy
    respond_to do |format|
      format.html { redirect_to groupgrant_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupgrant_category
      @groupgrant_category = GroupgrantCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupgrant_category_params
      params.require(:groupgrant_category).permit(:name)
    end
end
