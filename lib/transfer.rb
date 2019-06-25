class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == 'pending' && self.sender.balance > self.amount
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = 'complete'
      "Transaction was successful"
    elsif self.status == 'complete'
      self.status = "rejected"
      "Transaction has been completed"
    else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = 'reversed'
    end
  end

end
