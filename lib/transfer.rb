class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
      sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction

    if sender.balance > amount
      if self.status == "pending"
        sender.deposit(-amount)
        receiver.deposit(amount)
        self.status = "complete"
      end
    else
      self.status="rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(amount)
      receiver.deposit(-amount)
      self.status="reversed"
    end
  end


end
