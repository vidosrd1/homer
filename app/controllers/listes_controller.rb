class ListesController < ApplicationController
  before_action :set_liste, only: %i[ show edit update destroy ]

  # GET /listes or /listes.json
  def index
    @listes = Liste.all.order('created_at DESC')
    if params[:query].present?
      @listes = Liste.where("title LIKE ?", "%#{params[:query]}%")
    else
      @listes = Liste.all
    end

    # Not too clean but it works!
    if turbo_frame_request?
      render partial: "listes", locals: { listes: @listes }
    else
      render :index
    end
  end

  # GET /listes/1 or /listes/1.json
  def show
  end

  # GET /listes/new
  def new
    @liste = Liste.new
  end

  # GET /listes/1/edit
  def edit
  end

  # POST /listes or /listes.json
  def create
    @liste = Liste.new(liste_params)

    respond_to do |format|
      if @liste.save
        format.html { redirect_to liste_url(@liste), notice: "Liste was successfully created." }
        format.json { render :show, status: :created, location: @liste }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @liste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listes/1 or /listes/1.json
  def update
    respond_to do |format|
      if @liste.update(liste_params)
        format.html { redirect_to liste_url(@liste), notice: "Liste was successfully updated." }
        format.json { render :show, status: :ok, location: @liste }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @liste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listes/1 or /listes/1.json
  def destroy
    @liste.destroy

    respond_to do |format|
      format.html { redirect_to listes_url, notice: "Liste was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_liste
      @liste = Liste.find(params[:id])
    end

    def liste_params
      params.require(:liste).permit(:title,
        :image, :body, pictures: [])
    end
end
