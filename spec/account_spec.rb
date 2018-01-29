require 'account'

describe Account do

  let(:empty_account){Account.new}
  let(:account){Account.new(10)}


  it "Initialises with an initial balance of 0" do
    expect(empty_account.balance).to eq (0)
  end

  it "Can deposit money in the account" do
    expect{empty_account.deposit(10)}.to change {empty_account.balance}.from(0).to(10)
  end

  it "Can withdraw money from the account" do
    expect{account.withdraw(5)}.to change {account.balance}.from(10).to(5)
  end

  it "Cannot withdraw more money than is available in the account" do
    expect{account.withdraw(11)}.to raise_error("Insufficient funds available in account. You have #{account.balance} remaining.")
  end

  
end
