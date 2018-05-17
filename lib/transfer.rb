class Transfer

  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, guac)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = guac
  end

  def valid?
    # Checks if sender & receiver have positive balances
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    #Transfer money form acct sender to acct receiver
    if @status == "pending" && self.valid? && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
