require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance < @amount || @status == "closed"
       @status = "rejected"
       return "Transaction rejected. Please check your account balance."
    else @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end


--------------------------------------------------

  # def execute_transaction
  #   if @sender.close_account == true 
  #     @status = "rejected"
  #     return "Transaction rejected. Please check your account balance."
  #   elsif !(@sender.close_account) == true && @sender.balance > @amount && @status == "pending"
  #     @sender.balance -= @amount 
  #     @receiver.balance += @amount
  #     @status = "complete"
  #   end 
  # end 