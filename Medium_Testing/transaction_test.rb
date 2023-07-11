require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative "transaction"

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    item_cost = transaction.item_cost
    input = StringIO.new("30\n")
    output = <<~OUTPUT
    You owe $#{item_cost}.
    How much are you paying?
    OUTPUT

    assert_output(output) { transaction.prompt_for_payment(input: input) }

    second_transaction = Transaction.new(50)
    other_item_cost = second_transaction.item_cost
    other_input = StringIO.new("25\n50\n")
    other_output = <<~OTHER_OUTPUT
    You owe $#{other_item_cost}.
    How much are you paying?
    That is not the correct amount. Please make sure to pay the full cost.
    You owe $#{other_item_cost}.
    How much are you paying?
    OTHER_OUTPUT

    assert_output(other_output) { second_transaction.prompt_for_payment(input: other_input) }
  end
end