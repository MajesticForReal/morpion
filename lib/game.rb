class Game
  attr_accessor :current_player, :game_status

  def initialize
    intro
    $game_counter = 0
    puts "Nom du premier joueur :"
    print "> "
    player1_name = gets.chomp 
    $player1 = Player.new(player1_name, "X") 
    puts "-" * 23
    puts "Nom du deuxieme joueur :"
    print "> "
    player2_name = gets.chomp 
    $player2 = Player.new(player2_name, "O")
    puts
    print "#{$player1.name} tu as les #{$player1.symbol}"
    puts "#{$player2.name} tu as les #{$player2.symbol}"

    @current_player = $player1
  end
  
  def intro
    system("clear")
		puts "--------------------------------------------------------------------------------------------------------------"
		puts "|                                                                                                            |"
		puts "|                                    Bienvenue dans mon jeu de morpion :                                     |"
		puts "|                                 Ce jeu se joue a 2 il aura donc 2 joueurs                                  |"
		puts "|                   Chaque joueur possede un symbole (X ou O) et jouent l'un apres l'autre                   |"
		puts "|              Pour gagner les joueurs doivent aligner 3 symboles en ligne, colone ou diagonale              |"
		puts "| Si aucun des 2 joueurs n'y arrive et que le tableau est rempli la partie est terminee et personne ne gagne |"
		puts "|                                                                                                            |"
		puts "--------------------------------------------------------------------------------------------------------------"
  end

  def empty_position?(index)
    ($board[index] == " ") || ($board[index] == "") || ($board[index] == nil)
  end

  def is_valid?(input_choice)
    a = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    a.include?(input_choice) && empty_position?(a.index(input_choice))
  end

  def turn
    $counter % 2 == 0 ? @current_player = $player1 : @current_player = $player2
    case_choice = false
    while case_choice == false
      puts "#{@current_player.name}, choisis une case valide"
      print "> "
      input_choice = gets.chomp.upcase
      case_choice = is_valid?(input_choice)
    end
    $my_board.change_symbol(input_choice, @current_player.symbol)
  end

  def winner?
    win_combinaisons = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
    win_combinaisons.each do |win_combination|
      position_1 = $board[win_combination[0]]
      position_2 = $board[win_combination[1]]
      position_3 = $board[win_combination[2]]
      if !empty_position?(win_combination[0]) && position_1 == position_2 && position_2 == position_3
        return true
      end
    end
  end

  def full
    return $board.all? { |i| i == "X" || i == "O" }
  end

  def draw
    if !winner? && full
      return true
    elsif !winner? && !full      
		return false
    else !winner?
      return false     
    end
  end

  def game_end
    if draw == true || winner? == true  || full ==true
      return true
    end
  end

  def the_winner
    puts "Féliciations #{@current_player.name}, tu as gagné !"
  end

  def new_game
    puts
    puts "Voulez vous rejouer ? [Y/N]"
    print "> "
    user_input = gets.chomp.upcase
    if user_input == "Y"
      system("clear")
      puts "Nouvelle partie lancée !"
      Application.new.perform
      $game_counter += 1
    else
      puts
      system("ctrl+c")
    end
  end
end
