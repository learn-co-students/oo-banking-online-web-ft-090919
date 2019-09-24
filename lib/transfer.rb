require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
  def execute_transaction
    if @status != "complete" && @sender.valid? && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif @status != "complete" && (@sender.balance < @amount || @sender.valid? == false)
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
end
