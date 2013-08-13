class ClientTypesController < ApplicationController
  before_action :set_client_type, only: [:show, :edit, :update, :destroy]
  layout 'devise'

  # GET /client_types
  # GET /client_types.json
  def index
    @client_types = ClientType.all
  end

  # GET /client_types/1
  # GET /client_types/1.json
  def show
  end

  # GET /client_types/new
  def new
    @client_type = ClientType.new
  end

  # GET /client_types/1/edit
  def edit
  end

  # POST /client_types
  # POST /client_types.json
  def create
    @client_type = ClientType.new(client_type_params)

    respond_to do |format|
      if @client_type.save
        format.html { redirect_to @client_type, notice: 'Client type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @client_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @client_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_types/1
  # PATCH/PUT /client_types/1.json
  def update
    respond_to do |format|
      if @client_type.update(client_type_params)
        format.html { redirect_to @client_type, notice: 'Client type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_types/1
  # DELETE /client_types/1.json
  def destroy
    @client_type.destroy
    respond_to do |format|
      format.html { redirect_to client_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_type
      @client_type = ClientType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_type_params
      params.require(:client_type).permit(:name)
    end
end