class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if @status == "pending" && self.valid?
      if self.sender.balance >= @amount
        self.sender.balance -= @amount
        self.receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."

      end

    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      @status = "reversed"

    end
  end


# end of class
end
