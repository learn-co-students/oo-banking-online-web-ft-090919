class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amt)
    @balance += amt
  end

  def display_balance
    "Your balance is $" + @balance.to_s + "."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @balance = 0
    @status = "closed"
  end

end
