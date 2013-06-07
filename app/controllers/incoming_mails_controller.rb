class IncomingMailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    subject = params[:headers][:Subject]
    id = subject.match(/\d+$/).to_s
    ticket = Ticket.find(id)
    ticket.responses.create( body: params[:plain] )
    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end

end
