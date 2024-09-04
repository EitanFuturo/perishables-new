class PerishablesController < ApplicationController
  before_action :set_perishable, only: %i[ show edit update destroy ]

  # GET /perishables or /perishables.json
  def index
    @perishables = Perishable.all
  end

  # GET /perishables/1 or /perishables/1.json
  def show
  end

  # GET /perishables/new
  def new
    @perishable = Perishable.new
  end

  # GET /perishables/1/edit
  def edit
  end

  # POST /perishables or /perishables.json
  def create
    @perishable = Perishable.new(perishable_params)

    respond_to do |format|
      if @perishable.save
        format.html { redirect_to perishable_url(@perishable), notice: "Perishable was successfully created." }
        format.json { render :show, status: :created, location: @perishable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perishable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perishables/1 or /perishables/1.json
  def update
    respond_to do |format|
      if @perishable.update(perishable_params)
        format.html { redirect_to perishable_url(@perishable), notice: "Perishable was successfully updated." }
        format.json { render :show, status: :ok, location: @perishable }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perishable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perishables/1 or /perishables/1.json
  def destroy
    @perishable.destroy!

    respond_to do |format|
      format.html { redirect_to perishables_url, notice: "Perishable was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perishable
      @perishable = Perishable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perishable_params
      sanitize_days_to_expiration
      params.require(:perishable).permit(:name, :start_date, :expiration_date, :days_to_expiration)
    end

    def sanitize_days_to_expiration
      params[:perishable][:days_to_expiration] = params[:perishable][:days_to_expiration].to_i if params[:perishable][:days_to_expiration].present?
    end
end
