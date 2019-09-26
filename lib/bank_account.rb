require 'pry'

class BankAccount 
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name, balance = 1000, status = "open")
    @name = name 
    @balance = balance
    @status = status
    accounts = []
  end 

  def deposit(amount)
    self.balance += amount
    @balance
  end 

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && balance >= 1000
  end 

  def close_account
    self.status = "closed"
  end
 
end 