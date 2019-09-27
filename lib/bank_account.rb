class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end
  
  def deposit(amount)
   @balance = (@balance + amount)
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    @status == "open" and @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end
end


#avi = BankAccount.new
  #balance = 1000

    #avi.deposit(1000)
