class IncomingMailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    render :text => 'success', :status => 200 # a status of 404 would reject the mail
    # id = params[:subject][/\d+/].to_i # finds the first number of the subject line
    # @ticket = Ticket.find(id)
    # # ticket.responses.create( :body => params[:plain])    
    # @response = @ticket.responses.build( body: params[:plain] )    
    # # @ticket = ticket.responses.create( body: params[:plain])

    # if @response.save
    #   render :text => 'success', :status => 200 # a status of 404 would reject the mail
    # else
    #   render :text => 'Internal failure', :status => 501
    # end
    
  end

end
