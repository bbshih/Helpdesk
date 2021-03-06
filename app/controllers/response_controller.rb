class ResponseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_ticket
  before_filter :find_response, only: [:show, :edit, :update, :destroy]
  
  def create
    @response = @ticket.responses.build(response_params)
    if @response.save
      redirect_to [@ticket, @response]
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

  def find_response
    @response = response.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The response you were " +
                    "looking for could not be found."
    redirect_to root_path
  end
end
