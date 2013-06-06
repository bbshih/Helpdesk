class IncomingMailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    params[:subject] # print the subject to the logs
    params[:plain] # print the decoded body plain to the logs if present

    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end

end
