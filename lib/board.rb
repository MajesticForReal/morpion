class Board
  attr_accessor :array_board_case

  #On initialise un tableau avec des valeurs vides
  def initialize
    return @array_board_case = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  #Méthode pour changer de symbole
  #On vient modifier la case en fonction de ce que le joueur à choisi
  def change_symbol(user_cell_input, player_symbol)
    case user_cell_input
    when "A1" then @array_board_case[0] = "#{player_symbol}" #Si il a choisi A1, on remplace la 1ère case du tableau
    when "A2" then @array_board_case[1] = "#{player_symbol}"
    when "A3" then @array_board_case[2] = "#{player_symbol}"
    when "B1" then @array_board_case[3] = "#{player_symbol}"
    when "B2" then @array_board_case[4] = "#{player_symbol}"
    when "B3" then @array_board_case[5] = "#{player_symbol}"
    when "C1" then @array_board_case[6] = "#{player_symbol}"
    when "C2" then @array_board_case[7] = "#{player_symbol}"
    when "C3" then @array_board_case[8] = "#{player_symbol}"
    end
  end
end
