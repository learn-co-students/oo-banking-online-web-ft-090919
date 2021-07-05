class Transfer
  # code here
  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount=50, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    @sender.valid? == true and @receiver.valid? == true ? true : false
  end

#   def execute_transaction
#     if @sender.status = "closed" || !@sender.valid? || @sender.balance < @amount
#           @status = "rejected"
#           return "Transaction rejected. Please check your account balance."
#         # elsif
#         #   @status == "complete"
#     else
#       if valid? && sender.balance > amount && self.status == "pending"
#     sender.balance -= amount
#     receiver.balance =+ amount
#       self.status = "complete"
#     end
#   end
# end
# end

def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer

  end
  end

  def reverse_transfer
    if self.status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  end
