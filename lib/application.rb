class Application
  def perform
    system("clear")
    puts "Partie N°#{$game_counter}"
    puts
    puts "#{$player1.name}, tu commences !"    
    $my_board = Board.new 
    $board = $my_board.array_board_case
    $counter = 0 
    until $my_game.game_end
      Show.new.show_board($board) 
      $my_game.turn
      $counter += 1
      system("clear")
    end
    Show.new.show_board($board)
    puts "La partie est finie !"
    puts
    if $my_game.winner?
      $my_game.the_winner
    elsif $my_game.draw
      puts "Il y a égalité !"
    end
    $my_game.new_game
  end
end
