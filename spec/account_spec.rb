require 'account'

describe Account do

  subject(:account) {described_class.new}


  describe '#balance' do

    it{ expect(account).to respond_to(:balance) }

    it 'is initialized with a balance of 0' do
      expect(account.balance).to eq(0)
    end

  end
end
