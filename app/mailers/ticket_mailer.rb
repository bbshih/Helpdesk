class TicketMailer < ActionMailer::Base
  default from: "03cff7fed6e5474d4020@cloudmailin.net"
  
  def ticket_confirmation(ticket)
    @ticket = ticket
    mail(to: "me+ticket@billyshih.com", subject: @ticket.id.to_s + " " + @ticket.subject)
  end
end
