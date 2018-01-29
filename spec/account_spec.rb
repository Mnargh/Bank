require 'account'

describe Account do

  let(:empty_account){Account.new(0, transaction_class)}
  let(:account){Account.new(10, transaction_class)}
  let(:transaction_class){double(:transaction_class, new: deposit)}
  let(:deposit){double(:deposit, type: "Deposit", amount: 10, date: "29/1/2018")}

  context "Managing Account Balance" do
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

  context "Transactions" do
    it "Initialises with no previous transactions" do
      expect(empty_account.transactions).to be_empty
    end

    it "Making a deposit adds a deposit transaction to the account" do
      expect(transaction_class).to receive(:new)
      empty_account.deposit(10)
      expect(empty_account.transactions).to include(deposit)

    end
  end
  context "Printing" do
    it "Can print out the current account balance" do
      expect{account.print_balance}.to output("Your balance is #{account.balance}").to_stdout
    end
  end

end
