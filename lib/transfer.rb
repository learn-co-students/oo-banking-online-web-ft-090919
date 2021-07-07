
class Transfer

    attr_accessor :amount, :receiver, :sender, :status
  def initialize(sender, receiver, amount)
    @receiver = receiver
    @status = "pending"
    @sender = sender
    @amount = amount
  end

  def valid?
  sender.valid? && receiver.valid?
  end

  def execute_transaction
      @initial_sender = sender.balance
      @initial_receiver = receiver.balance
      if valid? && sender.balance > amount 
        if @status == "pending"
            receiver.balance += amount 
            sender.balance -= amount
            @status = "complete"
        end
      else
            @status = "rejected"
            "Transaction rejected. Please check your account balance."
      end
  end
  
  
  def reverse_transfer
    if @status == "complete"
      sender.balance = @initial_sender
      receiver.balance = @initial_receiver
      @status = "reversed"
    end
  end
  
  
end
