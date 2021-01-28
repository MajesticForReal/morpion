class Show

  #Méthode pour afficher le plateau
  def show_board(board)
    puts
    puts "     1   2   3"
    puts "   -------------"
    puts " A | #{board[0]} | #{board[1]} | #{board[2]} |"
    puts "   -------------"
    puts " B | #{board[3]} | #{board[4]} | #{board[5]} |"
    puts "   -------------"
    puts " C | #{board[6]} | #{board[7]} | #{board[8]} |"
    puts "   -------------"
    puts
  end
end
