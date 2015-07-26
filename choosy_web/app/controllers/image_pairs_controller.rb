class ImagePairsController < ApplicationController
  before_action :set_image_pair, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :edit, :update, :destroy]

  def votefirst
    @image_pair = ImagePair.find(params[:image_pair_id])
    @image_pair.votes_first += 1
    @image_pair.save
    current_user.voting_history.push(@image_pair.id)
    current_user.save
    redirect_to root_path(anchor: @image_pair)
  end

  def votesecond
    @image_pair = ImagePair.find(params[:image_pair_id])
    @image_pair.votes_second += 1
    @image_pair.save
    current_user.voting_history.push(@image_pair.id)
    current_user.save
    redirect_to root_path(anchor: @image_pair)
  end

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
    @image_pair.user = current_user
    @first_image = Image.new(avatar: params[:image_pair][:first_image])
    @second_image = Image.new(avatar: params[:image_pair][:second_image])
    @first_image.image_pair = @image_pair
    @first_image.save
    @second_image.image_pair = @image_pair
    @second_image.save
    respond_to do |format|
      if @image_pair.save
        current_user.voting_history.push(current_user.image_pairs.last.id)
        current_user.save
        format.html { redirect_to user_url(current_user), notice: 'Image pair was successfully created.' }
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
      params.require(:image_pair).permit(:votes_first, :votes_second, :user_id, :caption, comments_attributes: [:body])
    end
end
