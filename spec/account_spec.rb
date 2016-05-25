require 'account'

describe Account do

  subject(:account) {described_class.new(transaction_klass: transaction_klass)}

  let(:transaction_klass) { double(:transaction_klass, new: transaction) }
  let(:transaction) { double(:transaction) }


  describe '#initialize' do

    it{ expect(account).to respond_to(:balance) }

    it 'is initialized with a balance of 0' do
      expect(account.balance).to eq(0)
    end
    it 'initializes with an empty history' do
      expect(account.history).to eq []
    end
  end

  describe '#withdraw' do

    before(:each) do
      account.withdraw(500)
    end

    it 'creates a transaction with negative integer as amount' do
      expect(transaction_klass).to have_received(:new).with(-500, -500)
    end

    it 'subtract from the balance when withdrawal is made' do
     expect(account.balance).to eq -500
    end

   it 'saves the transaction history in the array' do
     last_transaction = account.history.last
     expect(last_transaction).to eq transaction
   end
  end

  describe '#deposit' do

    before(:each) do
      account.deposit(500)
    end

    it 'creates a transaction with positive integer as amount' do
      expect(transaction_klass).to have_received(:new).with(500, 500)
    end

    it 'adds to the balance when deposit is made' do
     expect(account.balance).to eq 500
    end

   it 'saves the transaction history in the array' do
     last_transaction = account.history.last
     expect(last_transaction).to eq transaction
   end

  end

end
