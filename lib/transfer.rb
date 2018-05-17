require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, transfer=50)

    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = transfer
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    #binding.pry
    if valid? == true && @status == 'pending' && @sender.balance - @amount > 0
      @receiver.balance = @receiver.balance + @amount
      @sender.balance = @sender.balance - @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
    @sender.balance = @sender.balance + @amount
    @receiver.balance = @receiver.balance - @amount
  end
    @status = "reversed"
  end

end