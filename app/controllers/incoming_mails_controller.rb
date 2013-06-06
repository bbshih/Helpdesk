class IncomingMailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    id = params[:subject][/\d+/].to_i # finds the first number of the subject line
    @ticket = Ticket.find(id)
    @ticket.body += "<br>Response: <br>" + params[:plain]

    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end

end
