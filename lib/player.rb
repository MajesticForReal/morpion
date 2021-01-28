class Player
  attr_accessor :name, :symbol

 #On initialise les inputs pour les joueurs
  def initialize(player_name, player_symbol)
    @name = player_name
    @symbol = player_symbol
  end
end
