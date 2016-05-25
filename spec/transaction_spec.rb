require 'transaction'

describe Transaction do

  date = Time.now.strftime("%d/%m/%Y")
  amount = 100
  balance = 200

  subject(:transaction) { described_class.new(amount, balance) }

  describe '#initialize' do
    it 'initializes with a date' do
      expect(transaction.date).to eq(date)
    end
    it 'initializes with an amount' do
      expect(transaction.amount).to eq(amount)
    end
    it 'initializes with a balance' do
      expect(transaction.balance).to eq(balance)
    end
  end

end
