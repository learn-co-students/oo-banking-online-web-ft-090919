require_relative "bank_account.rb"

class Transfer
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if valid? && @status == "pending" && @sender.enough_balance?(amount)
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end