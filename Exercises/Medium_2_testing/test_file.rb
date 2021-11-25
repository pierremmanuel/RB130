require 'minitest/autorun'
require_relative 'transaction'
require_relative 'cash_register'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(15)
    transaction.amount_paid = 20

    previous_amount = cash_register.total_money
    cash_register.accept_money(transaction)
    current_amount = cash_register.total_money

    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(15)
    transaction.amount_paid = 20

    assert_equal(5, cash_register.change(transaction))
  end

  def test_give_receipt
    item_cost = 35
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end
end

class TransactionTest < Minitest::Test
    def test_prompt_for_payment
      transaction = Transaction.new(30)
      input = StringIO.new('30\n')
      output = StringIO.new
      transaction.prompt_for_payment(input: input, output: output)
      assert_equal 30, transaction.amount_paid
    end
end
