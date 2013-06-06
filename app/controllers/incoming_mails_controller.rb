class IncomingMailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    subject = params[:headers][:Subject]
    id = subject.match(/\d+$/).to_s
    # id = [/\d+/] # finds the first number of the subject line
    ticket = Ticket.find(id)

    # doesn't work b/c of fixed parameters?
    # @response = @ticket.responses.build( body: params[:plain] )  

    # @ticket.responses.create( body: params[:plain] )

    # if @response.save
    render :text => 'success', :status => 200 # a status of 404 would reject the mail
    # else
    #   render :text => 'Internal failure', :status => 501
    # end    
  end

end
