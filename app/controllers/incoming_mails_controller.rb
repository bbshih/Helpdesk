class IncomingMailsController < ApplicationController
  def create
    puts params

      render :text => 'Success', :status => 200

  end



  # skip_before_filter :verify_authenticity_token

  # def create

    # Rails.logger.log params[:envelope][:to] # print the to field to the logs
    #     Rails.logger.log params[:subject] # print the subject to the logs
    #     Rails.logger.log params[:plain] # print the decoded body plain to the logs if present
    #     Rails.logger.log params[:html] # print the html decoded body to the logs if present
    #     Rails.logger.log params[:attachments][0] if params[:attachments] # A tempfile attachment if attachments is populated

    # id = params[:subject][/\d+/].to_i # finds the first number of the subject line
    # Rails.logger.info id

    # ticket = Ticket.find(id)
    # Rails.logger.info params[:ticket]
    
    # ticket.responses.build
    
    # ticket.responses.create( body: params[:plain])
  #   render :text => 'success', :status => 200 # a status of 404 would reject the mail
  # end

end
