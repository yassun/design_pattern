require 'singleton'

class TicketMaker
  include Singleton

  attr_accessor :tiket

  def initialize
    @tiket = 0
  end

  def get_next_ticket_number
    @tiket = @tiket + 1
  end

end

ticket1 = TicketMaker.instance
puts(ticket1.get_next_ticket_number)

ticket2 = TicketMaker.instance
puts(ticket2.get_next_ticket_number)


