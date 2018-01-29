require 'account'

describe Account do

  let(:account){Account.new}

  it "Initialises with an initial balance of 0" do
    expect(account.balance).to eq (0)
  end
end
