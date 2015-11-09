class ConfigurationKeysController < ApplicationController
  before_action :set_configuration_key, only: [:show, :edit, :update, :destroy]

  # GET /configuration_keys
  # GET /configuration_keys.json
  def index
    @configuration_keys = ConfigurationKey.all
  end

  # GET /configuration_keys/1
  # GET /configuration_keys/1.json
  def show
  end

  # GET /configuration_keys/new
  def new
    @configuration_key = ConfigurationKey.new
  end

  # GET /configuration_keys/1/edit
  def edit
  end

  # POST /configuration_keys
  # POST /configuration_keys.json
  def create
    @configuration_key = ConfigurationKey.new(configuration_key_params)

    respond_to do |format|
      if @configuration_key.save
        format.html { redirect_to @configuration_key, notice: 'Configuration key was successfully created.' }
        format.json { render action: 'show', status: :created, location: @configuration_key }
      else
        format.html { render action: 'new' }
        format.json { render json: @configuration_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuration_keys/1
  # PATCH/PUT /configuration_keys/1.json
  def update
    respond_to do |format|
      if @configuration_key.update(configuration_key_params)
        format.html { redirect_to @configuration_key, notice: 'Configuration key was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @configuration_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuration_keys/1
  # DELETE /configuration_keys/1.json
  def destroy
    @configuration_key.destroy
    respond_to do |format|
      format.html { redirect_to configuration_keys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration_key
      @configuration_key = ConfigurationKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configuration_key_params
      params.require(:configuration_key).permit(:key, :value, :description, :section)
    end
end
