require 'pry'
class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if valid? && @status == 'pending' && sender.balance >= @amount
      @status = "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
    else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @status = "reversed"
      @receiver.balance -= @amount
      @sender.balance += @amount
    end
  end
end
