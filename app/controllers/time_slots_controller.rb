class TimeSlotsController < ApplicationController
  before_action :set_time_slot, only: [:show, :edit, :update, :destroy]

  # GET /time_slots
  # GET /time_slots.json
  def index
    @time_slots = TimeSlot.all
  end

  # GET /time_slots/1
  # GET /time_slots/1.json
  def show
  end

  # GET /time_slots/new
  def new
    @time_slot = TimeSlot.new
    @user = User.find(params[:user_id])
    @appointment = Appointment.find_by_slug(params[:id])
  end

  # GET /time_slots/1/edit
  def edit
    time_slot_id = params[:id]
    @time_slot = time_slot_id(time_slot_id)
    render :edit
  end

  # POST /time_slots
  # POST /time_slots.json
  def create
    if current_user
      @time_slot = TimeSlot.new(time_slot_params)
      @user = User.find(params(:user_id))
      @appointment = Appointment.find_by_slug(params[:id])
        respond_to do |format|
        if @time_slot.save
          @appointment.time_slots << @time_slot
          @current_user.time_slots << @time_slot
          @appointment.save
          @current_user.save
          flash[:notice] = "Successful time slot at "+ @appointment.date
          format.html { redirect_to @time_slot, notice: 'Time slot was successfully created.' }
          format.json { render :show, status: :created, location: @time_slot }
          redirect_to @appointment
        elsif @time_slot.destroy
          flash[:error] = "There was a problem, try again"
          redirect_to @appointment
        else
          flash[:error] = "You must be admin to create timeslots"
          format.html { render :new }
          format.json { render json: @time_slot.errors, status: :unprocessable_entity }
          redirect_to new_time_slot_path
        end
      end
    end
  end

  # PATCH/PUT /time_slots/1
  # PATCH/PUT /time_slots/1.json
  def update
    get_id.update_attributes(time_slot_params)
    redirect_to user_path(user)
    respond_to do |format|
      if @time_slot.update(time_slot_params)
        format.html { redirect_to @time_slot, notice: 'Time slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_slot }
      else
        format.html { render :edit }
        format.json { render json: @time_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_slots/1
  # DELETE /time_slots/1.json
  def destroy
    @time_slot.destroy
    redirect_to user_path
    respond_to do |format|
      format.html { redirect_to time_slots_url, notice: 'Time slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_slot
      @time_slot = TimeSlot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_slot_params
      params.require(:time_slot).permit(:name, :start_time)
    end
