class IncomingMailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    # Rails.logger.info params
    # Rails.logger.log params[:plain].
    # Rails.logger.info params[:headers]['Subject']
    raise params.inspect
    
    id = params[:headers][:Subject][/\d+/] # finds the first number of the subject line

    Rails.logger.info id
    @ticket = Ticket.find(id)
    # ticket.responses.create( :body => params[:plain])    
    @response = @ticket.responses.build( body: params[:plain] )    
    # @ticket = ticket.responses.create( body: params[:plain])

    if @response.save
      render :text => 'success', :status => 200 # a status of 404 would reject the mail
    else
      render :text => 'Internal failure', :status => 501
    end    
  end

end
