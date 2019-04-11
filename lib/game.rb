class Game
  attr_accessor(:board,:player_1,:player_2)

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1=player_1
    @player_2=player_2
    @board=board
  end

  WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagnol One
  [6,4,2], #Diagnol Two
  ]

  def player_1=(p1)
    @player_1=p1
  end

  def player_2=(p2)
    @player_2=p2
  end

  def current_player
    if @board.turn_count.even? || @board.turn_count.zero?
      return @player_1
    else
      return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    if !self.won? && @board.full?
      return true
    else
      return false
    end
  end

  def over?
    if self.won? || self.draw?
      return true
    else
      return false
    end
  end

  def winner
    if self.won?
      combo=self.won?
      return @board.cells[combo[1]]
    else
      return nil
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  def play
    until self.over?
      turn
    end

    if self.won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat\'s Game!"
    end
  end

  def start
    puts "Welcome to the ultimate game of Tic-tac-toe"
    puts "Please enter how many players are going"
    players = gets.chomp
    if players == "2"
      initialize
      play
    elsif players == "1"
      initialize(Players::Human.new("X"),Players::Computer.new("O"),Board.new)
      play
    else
      initialize(Players::Computer.new("X"),Players::Computer.new("O"),Board.new)
      play
    end
  end

end
