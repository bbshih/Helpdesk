class IncomingMailsController < ApplicationController
  def create
    Rails.logger.info params
    message = Message.new(
      :to => params[:envelope][:to],
      :from => params[:envelope][:from],
      :subject => params[:headers]['Subject'],
      :body => params[:plain]
    )
    if message.save
      render :text => 'Success', :status => 200
    else
      render :text => message.errors.full_messages, :status => 422, :content_type => Mime::TEXT.to_s
    end
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
