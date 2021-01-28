class Application
  #Méthode qui va faire tourner la partie
  def perform
    system("clear")
    puts "Partie N°#{$game_counter}" #Affichage du numéro de la partie
    puts
    puts "#{$player1.name}, tu commences !"    
    $my_board = Board.new #On initalise le plateau de jeu
    $board = $my_board.array_board_case #On définie un variable globale correspondant au tableau du morpion
    $counter = 0 #On initialise le compteur de tour
    until $my_game.game_end #Tant que le jeu n'est pas fini on continue
      Show.new.show_board($board) #On affiche la plateau de jeu
      $my_game.turn #On lance un tour
      $counter += 1 #On incrémente le tour pour passer au joueur suivant
      system("clear")
    end
    Show.new.show_board($board)
    puts "La partie est finie !" #Une fois la partie finie, on vérifie si il y a un gagnant ou non
    puts
    if $my_game.winner? #On regarde si il y a un gagnant
      $my_game.the_winner #On détermine le gagnant
    elsif $my_game.draw #En cas d'égalité
      puts "Il y a égalité !"
    end
    $my_game.new_game #On demande au joueurs si ils veulent refaire une partie
  end
end
