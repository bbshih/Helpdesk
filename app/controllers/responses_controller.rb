class ResponsesController < ApplicationController
  before_filter :find_ticket
  
  def new
    @response = @ticket.responses.build
  end

  def create
    @response = @ticket.responses.build(response_params)
    if @response.save
      redirect_to @ticket
    else
      render action: "new"
    end
  end

  private
  def response_params
    params.require(:response).permit(:body)
  end

  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The ticket you were looking for could not be found."
    redirect_to root_path
  end

  # def find_response
  #   @response = response.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  #   flash[:alert] = "The response you were " +
  #                   "looking for could not be found."
  #   redirect_to root_path
  # end
end
