class Game
  attr_accessor :current_player, :game_status

  #Méthode pour initialiser les joueurs
  def initialize
    intro
    $game_counter = 0 #On initialise le compteur de parties
    puts "Joueur 1, choisis un nom"
    print "> "
    player1_name = gets.chomp #Le joueur 1 choisi son nom
    $player1 = Player.new(player1_name, "X") #On initialise son joueur
    puts "-" * 23
    puts "Joueur 2, choisis un nom"
    print "> "
    player2_name = gets.chomp #Le joueur 1 choisi son nom
    $player2 = Player.new(player2_name, "O") #On initialise son joueur
    puts
    print "#{$player1.name} tu as les #{$player1.symbol}"
    puts "#{$player2.name} tu as les #{$player2.symbol}"

    @current_player = $player1 #On défini qui va jouer en 1er
  end
  
  #Méthode d'affichage du message d'intro
  def intro
    system("clear")
    puts "--------------------------------------------------" 
    puts "|        Bienvenue dans le jeu du Morpion        |"
    puts "|   Bats ton adversaire dans ce jeu mythique !   |"
    puts "--------------------------------------------------" 
    puts
  end

  #Méthode pour regarder si une case est vide
  def empty_position?(index)
    ($board[index] == " ") || ($board[index] == "") || ($board[index] == nil)
  end

  #Méthode pour définir si une case est valide càd en prenant un bon input et si la case n'est pas déjà occupée
  def is_valid?(input_choice)
    a = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    a.include?(input_choice) && empty_position?(a.index(input_choice))
  end

  #Méthode pour effectuer un tour de jeu
  def turn
    $counter % 2 == 0 ? @current_player = $player1 : @current_player = $player2 #On définie quel joueur va jouer pour le tour en cours
    case_choice = false
    while case_choice == false #Tant que le choix du joueur n'est pas bon, on recommence
      puts "#{@current_player.name}, choisis une case valide"
      print "> "
      input_choice = gets.chomp.upcase #Le joueur choisi une case
      case_choice = is_valid?(input_choice) #On vient vérifier si le caractère est bon et si la case choisie n'est pas déjà occupée
    end
    $my_board.change_symbol(input_choice, @current_player.symbol) #Si la case est valide on vient mettre le symbol du joueur dans la case correspondante
  end

  #Méthode pour déterminer si une combinaison est gagnante
  def winner?
    win_combinaisons = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]] #Liste des combinaisons gagnantes
    win_combinaisons.each do |win_combination| #On vient regarder chaque combinaison
      position_1 = $board[win_combination[0]]
      position_2 = $board[win_combination[1]]
      position_3 = $board[win_combination[2]]
      if !empty_position?(win_combination[0]) && position_1 == position_2 && position_2 == position_3 #Si les 3 cases sont égales et non vide, on valide la combinaison
        return true
      end
    end
  end

  #Méthode pour vérifier si tout le plateau est rempli
  def full
    return $board.all? { |i| i == "X" || i == "O" }
  end

  #Méthode pour déterminer le cas d'égalité
  def draw
    if !winner? && full #Si il n'y a pas de gagnant mais que le plateau est plein, il y a égalité
      return true
    elsif !winner? && !full #Si il n'y a pas de gagnant et que le plateau n'est pas plein, on continue
      return false
    else !winner? #Si il n'y a pas de gagnant, on continue
      return false     
    end
  end

  #Méthode pour définir quand la partie s'arrête
  def game_end
    if draw == true || winner? == true  || full ==true #Sil il y a égalité ou un gagnant ou que le plateau est plein, la partie est finie
      return true
    end
  end

  #Méthode pour déterminer le gagnant
  def the_winner
    puts "Féliciations #{@current_player.name}, tu as gagné !"
  end

  #Méthode pour relancer une partie
  def new_game
    puts
    puts "Voulez vous rejouer ? [Y/N]"
    print "> "
    user_input = gets.chomp.upcase
    if user_input == "Y" #Si les joueurs veulent rejouer
      system("clear")
      puts "Nouvelle partie lancée !"
      Application.new.perform #On relance une partie sans effacer les joueurs
      $game_counter += 1
    else
      puts
      puts "Merci d'avoir joué :)"
      system("ctrl+c") #Sinon, on quitte le jeu
    end
  end
end
