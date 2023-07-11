# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register1 = CashRegister.new(100)
    @transaction1 = Transaction.new(40)
  end
  
  def test_accept_money
    previous_amount = @register1.total_money
    @transaction1.amount_paid = 40
    @register1.accept_money(@transaction1)
    total_amount = previous_amount + @transaction1.amount_paid
    assert_equal(total_amount, @register1.total_money)
  end

  def test_change
    @transaction1.amount_paid = 100
    paid = @transaction1.amount_paid
    cost = @transaction1.item_cost
    change = paid - cost
    assert_equal(change, @register1.change(@transaction1))
  end

  def test_give_reciept
    string = "You've paid $#{@transaction1.item_cost}.\n"
    assert_output(string) { @register1.give_receipt(@transaction1) }
  end
end