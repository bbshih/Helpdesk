class TicketMailer < ActionMailer::Base
  default from: "me@billyshih.com"

  def ticket_confirmation(ticket)
    @ticket = ticket
    mail(to: "me@billyshih.com", subject: @ticket.subject)
  end
end
