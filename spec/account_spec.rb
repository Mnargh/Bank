require 'account'

describe Account do

  let(:empty_account){Account.new(0, transaction_class_deposit)}
  let(:account){Account.new(10, transaction_class_withdrawal)}
  let(:transaction_class_deposit){double(:transaction_class, new: deposit)}
  let(:transaction_class_withdrawal){double(:transaction_class, new: withdrawal)}
  let(:deposit){double(:deposit, type: "Deposit", amount: 10, date: "29/01/2018")}
  let(:withdrawal){double(:withdrawal, type: "Withdrawal", amount: 5, date: "29/01/2018")}

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
      expect(transaction_class_deposit).to receive(:new)
      empty_account.deposit(10)
      expect(empty_account.transactions).to include(deposit)
    end

    it "Making a withdrawal adds a withdrawal transaction to the account" do
      expect(transaction_class_withdrawal).to receive(:new)
      account.withdraw(5)
      expect(account.transactions).to include(withdrawal)
    end
  end
  context "Printing" do
    let(:account_for_withdrawal){Account.new(30, transaction_class_withdrawal)}
    let(:account_for_deposit){Account.new(30, transaction_class_deposit)}

    it "Can print out the current account balance" do
      expect{empty_account.print_balance}.to output("Your balance is 0").to_stdout
    end

    it "Can print out a single withdrawal in the correct format" do
      account_for_withdrawal.withdraw(5)
      expect{account_for_withdrawal.print_statement}.to output(<<~MESSAGE).to_stdout
      date || credit || debit || balance
      29/01/2018 || || 5.00 || 25.00
      MESSAGE
    end
    it "Can print out a single deposit in the correct format" do
      account_for_deposit.deposit(5)
      expect{account_for_deposit.print_statement}.to output(<<~MESSAGE).to_stdout
      date || credit || debit || balance
      29/01/2018 || 10.00 || || 35.00
      MESSAGE
    end
  end

end
