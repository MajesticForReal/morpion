class BoardCase
  attr_accessor :symbol_case, :num_cell

  #On initialise les inputs
  def initialize(cell, symbol)
    @symbol_case = symbol
    @num_cell = cell
  end
end
