class SidekiqexemplosController < ApplicationController
  before_action :set_sidekiqexemplo, only: [:show, :edit, :update, :destroy]

  # GET /sidekiqexemplos
  # GET /sidekiqexemplos.json
  def index
    @sidekiqexemplos = Sidekiqexemplo.all
  end

  # GET /sidekiqexemplos/1
  # GET /sidekiqexemplos/1.json
  def show
  end

  # GET /sidekiqexemplos/new
  def new
    @sidekiqexemplo = Sidekiqexemplo.new
  end

  # GET /sidekiqexemplos/1/edit
  def edit
  end

  # POST /sidekiqexemplos
  # POST /sidekiqexemplos.json
  def create
    @sidekiqexemplo = Sidekiqexemplo.new(sidekiqexemplo_params)

    if @sidekiqexemplo.save


      PygmentsWorker.perform_async(@sidekiqexemplo.id)
      redirect_to @sidekiqexemplo

    else
      render :new
    end

      
    
  end

  # PATCH/PUT /sidekiqexemplos/1
  # PATCH/PUT /sidekiqexemplos/1.json
  def update
    respond_to do |format|
      if @sidekiqexemplo.update(sidekiqexemplo_params)
        format.html { redirect_to @sidekiqexemplo, notice: 'Sidekiqexemplo was successfully updated.' }
        format.json { render :show, status: :ok, location: @sidekiqexemplo }
      else
        format.html { render :edit }
        format.json { render json: @sidekiqexemplo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sidekiqexemplos/1
  # DELETE /sidekiqexemplos/1.json
  def destroy
    @sidekiqexemplo.destroy
    respond_to do |format|
      format.html { redirect_to sidekiqexemplos_url, notice: 'Sidekiqexemplo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sidekiqexemplo
      @sidekiqexemplo = Sidekiqexemplo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sidekiqexemplo_params
      params.require(:sidekiqexemplo).permit(:tipo, :codigo)
    end
end
