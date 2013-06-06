class IncomingMailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    put "Received mail"
    Rails.logger.log params[:envelope][:to] # print the to field to the logs
    Rails.logger.log params[:subject] # print the subject to the logs
    Rails.logger.log params[:plain] # print the decoded body plain to the logs if present
    Rails.logger.log params[:html] # print the html decoded body to the logs if present
    Rails.logger.log params[:attachments][0] if params[:attachments] # A tempfile attachment if attachments is populated

    id = params[:subject][/\d+/].to_i # finds the first number of the subject line
    

    @ticket = Ticket.find(id)
    # ticket.responses.create( :body => params[:plain])    
    
    @response = @ticket.responses.build( body: params[:plain])    
    # @ticket = ticket.responses.create( body: params[:plain])

    if @response.save
      render :text => 'success', :status => 200 # a status of 404 would reject the mail
    else
      render :text => 'Internal failure', :status => 501
    end
    
  end

end
