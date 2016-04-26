class DemoStaffMembersController < ApplicationController
  before_action :set_demo_staff_member, only: [:show, :edit, :update, :destroy]

  # GET /demo_staff_members
  # GET /demo_staff_members.json
  def index
    @demo_staff_members = DemoStaffMember.all
  end

  # GET /demo_staff_members/1
  # GET /demo_staff_members/1.json
  def show
  end

  # GET /demo_staff_members/new
  def new
    @demo_staff_member = DemoStaffMember.new
  end

  # GET /demo_staff_members/1/edit
  def edit
  end

  # POST /demo_staff_members
  # POST /demo_staff_members.json
  def create
    @demo_staff_member = DemoStaffMember.new(demo_staff_member_params)

    respond_to do |format|
      if @demo_staff_member.save
        format.html { redirect_to @demo_staff_member, notice: 'Demo staff member was successfully created.' }
        format.json { render :show, status: :created, location: @demo_staff_member }
      else
        format.html { render :new }
        format.json { render json: @demo_staff_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demo_staff_members/1
  # PATCH/PUT /demo_staff_members/1.json
  def update
    respond_to do |format|
      if @demo_staff_member.update(demo_staff_member_params)
        format.html { redirect_to @demo_staff_member, notice: 'Demo staff member was successfully updated.' }
        format.json { render :show, status: :ok, location: @demo_staff_member }
      else
        format.html { render :edit }
        format.json { render json: @demo_staff_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demo_staff_members/1
  # DELETE /demo_staff_members/1.json
  def destroy
    @demo_staff_member.destroy
    respond_to do |format|
      format.html { redirect_to demo_staff_members_url, notice: 'Demo staff member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demo_staff_member
      @demo_staff_member = DemoStaffMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demo_staff_member_params
      params.require(:demo_staff_member).permit(:name, :phone, :RFC, :CURP, :NSS)
    end
end
