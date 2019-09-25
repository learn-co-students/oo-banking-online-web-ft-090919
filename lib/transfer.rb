class Transfer
  attr_reader :sender, :receiver, :amount 
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end 
  
  def execute_transaction
    if self.valid? && self.status == "pending"
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      self.status = "complete"
    elsif !self.valid?
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    if self.status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      self.status = "reversed"
    else 
      return "No transfer to reverse."
    end 
  end 
end

# describe '#reverse_transfer' do
#     it "can reverse a transfer between two accounts" do
#       transfer.execute_transaction
#       expect(amanda.balance).to eq(950)
#       expect(avi.balance).to eq(1050)
#       transfer.reverse_transfer
#       expect(avi.balance).to eq(1000)
#       expect(amanda.balance).to eq(1000)
#       expect(transfer.status).to eq("reversed")
#     end

#     it "it can only reverse executed transfers" do
#       transfer.reverse_transfer
#       expect(amanda.balance).to eq(1000)
#       expect(avi.balance).to eq(1000)
#     end
#   end