require 'account'

describe Account do

  let(:account){Account.new}

  it "Initialises with an initial balance of 0" do
    expect(account.balance).to eq (0)
  end

  it "Can deposit money in the account" do
    expect{account.deposit(10)}.to change {account.balance}.from(0).to(10)
  end
end
