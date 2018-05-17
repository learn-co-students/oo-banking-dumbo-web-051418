require 'pry'
require_relative './bank_account.rb'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
  return true if sender.valid? && receiver.valid? == true
  end


  def execute_transaction
    if @status != "complete"
      if sender.balance > amount && self.valid?
         sender.balance -= amount
         receiver.balance += amount
        @status = "complete"
      else
        @status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    end
  end


def reverse_transfer
  if @status == "complete"
    if sender.balance > amount && self.valid?
       receiver.balance -= amount
       sender.balance += amount
      @status = "reversed"
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
end
end




# eric = BankAccount.new("Eric",2000, 'open')
# michael = BankAccount.new("Michael",2000, 'open')
#
# transfer = Transfer.new(eric, michael, 1000)

# p transfer
