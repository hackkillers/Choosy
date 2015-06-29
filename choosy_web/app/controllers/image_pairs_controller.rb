class ImagePairsController < ApplicationController
  before_action :set_image_pair, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :show, :edit, :update, :destroy]

  # GET /image_pairs
  # GET /image_pairs.json
  def index
    @image_pairs = ImagePair.all
  end

  # GET /image_pairs/1
  # GET /image_pairs/1.json
  def show
    @images = Image.where(image_pair_id: params[:id])
  end

  # GET /image_pairs/new
  def new
    @image_pair = ImagePair.new
  end

  # GET /image_pairs/1/edit
  def edit
  end

  # POST /image_pairs
  # POST /image_pairs.json
  def create
    @image_pair = ImagePair.new(image_pair_params)
    @image_pair.user_id = current_user.id

    @first_image = Image.new(avatar: params[:image_pair][:first_image])
    @second_image = Image.new(avatar: params[:image_pair][:second_image])
    @first_image.save
    @second_image.save
    respond_to do |format|
      if @image_pair.save
        format.html { redirect_to @image_pair, notice: 'Image pair was successfully created.' }
        format.json { render :show, status: :created, location: @image_pair }
      else
        format.html { render :new }
        format.json { render json: @image_pair.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /image_pairs/1
  # PATCH/PUT /image_pairs/1.json
  def update
    respond_to do |format|
      if @image_pair.update(image_pair_params)
        format.html { redirect_to @image_pair, notice: 'Image pair was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_pair }
      else
        format.html { render :edit }
        format.json { render json: @image_pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_pairs/1
  # DELETE /image_pairs/1.json
  def destroy
    @image_pair.destroy
    respond_to do |format|
      format.html { redirect_to image_pairs_url, notice: 'Image pair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_pair
      @image_pair = ImagePair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_pair_params
      params.require(:image_pair).permit(:votes_first, :votes_second, :user_id)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to signin_path
      end
    end
end
