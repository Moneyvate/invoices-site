require 'hours_calculator'

class WorkLogsController < ApplicationController
  before_action :set_work_log, only: [:show, :edit, :update, :destroy]
  after_action :set_hours, only: [:new, :create, :edit, :update]
  layout 'devise'

  # GET /work_logs
  # GET /work_logs.json
  def index
    @work_logs = WorkLog.all
  end

  # GET /work_logs/1
  # GET /work_logs/1.json
  def show
  end

  # GET /work_logs/new
  def new
    @work_log = WorkLog.new
  end

  # GET /work_logs/1/edit
  def edit
  end

  # POST /work_logs
  # POST /work_logs.json
  def create
    @work_log = WorkLog.new(work_log_params)

    respond_to do |format|
      if @work_log.save
        format.html { redirect_to @work_log, notice: 'Work log was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_log }
      else
        format.html { render 'new' }
        format.json { render json: @work_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_logs/1
  # PATCH/PUT /work_logs/1.json
  def update
    respond_to do |format|
      if @work_log.update(work_log_params)
        format.html { redirect_to task_path(@work_log.task_id), notice: 'Work log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render 'edit' }
        format.json { render json: @work_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_logs/1
  # DELETE /work_logs/1.json
  def destroy
    @task = @work_log.task
    @work_log.destroy
    respond_to do |format|
      format.html { redirect_to task_url(@task) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_log
      @work_log = WorkLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_log_params
      params.require(:work_log).permit(:task_id, :start_date, :start_time, :end_date, :end_time, :hours)
    end

    # Sum up the hours entered for the current work log.
    def set_hours
      hc = HoursCalculator.new(@work_log)
      @work_log.hours = hc.calculate
      @work_log.save!
    end
end
