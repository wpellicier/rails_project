class EvaluationsController < ApplicationController
    #belongs_to :student
    before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
    #before_action :logged_in_user, only: [:create, :destroy]
  
    # GET /evaluations
    # GET /evaluations.json
    def index
      @evaluations = Evaluation.all
    end
  
    # GET /evaluations/1
    # GET /evaluations/1.json
    def show
    end
  
    # GET /evaluations/new
    def new
      @evaluation = Evaluation.new
    end
  
    # GET /evaluations/1/edit
    def edit
    end
  
    # POST /evaluations
    # POST /evaluations.json
    def create
      @current_student = Student.find_by(id: session[:student_id]) # ADDED THIS BUT NOT DONE
      # Get the two params then add the rest later? Still need to figure out how to get evaluee id
      @evaluation =  Evaluation.new(evaluation_params)
      if @evaluation.save
        flash[:success] = "Evaluation submitted"
        redirect_to student_evaluation_path
      else
        flash[:warning] = "Could not submit"
        redirect_to student_evaluation_path
      end
    end
  
    # PATCH/PUT /evaluations/1
    # PATCH/PUT /evaluations/1.json
    def update
      respond_to do |format|
        if @evaluation.update(evaluation_params)
          format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
          format.json { render :show, status: :ok, location: @evaluation }
        else
          format.html { render :edit }
          format.json { render json: @evaluation.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /evaluations/1
    # DELETE /evaluations/1.json
    def destroy
      @evaluation.destroy
      respond_to do |format|
        format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_evaluation
        @evaluation = Evaluation.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def evaluation_params
        params.permit(:evaluation, :evaluator_id, :evaluee_id, :project_id, :comment)
      end
  end
  