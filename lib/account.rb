class Account

  attr_reader :balance, :history

  def initialize(transaction_klass: Transaction)
    @balance = 0
    @history = []
    @transaction_klass = transaction_klass
  end

  def withdraw(amount)
    update_balance(-amount)
    save_transaction_history(-amount, @balance)
  end




private

  def update_balance(amount)
    @balance += amount
  end

  def save_transaction_history(amount, balance)
    transaction = @transaction_klass.new(amount, balance)
    @history << transaction
  end

end
