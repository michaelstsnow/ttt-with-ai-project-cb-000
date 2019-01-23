class Board
  attr_accessor(:cells)

  def initialize
    @cells=[" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells=[" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    index_value=input_to_index(user_input)
    @cells[index_value]
  end

  def input_to_index(user_input)
    if user_input.is_a? String
      user_input.to_i - 1
    else
      user_input - 1
    end
  end

  def full?
    contents=@cells.find_all { |cell| cell == "X" || cell =="O"}
    if contents.size == 9
      return true
    else
      return false
    end
  end

  def turn_count
    contents=@cells.find_all { |cell| cell == "X" || cell =="O"}
    contents.size
  end

  def taken?(user_input)
    index_value=input_to_index(user_input)
    contents=@cells[index_value]
    if contents == "X" || contents == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(user_input)
    begin
      index_value=input_to_index(user_input)
      if index_value <=8 && index_value>=0 && !taken?(user_input) && !full?
        return true
      else
        return false
      end
    rescue
      return false
    end
  end

  def update(position,player)
    if valid_move?(position)
      index_value=input_to_index(position)
      @cells[index_value]=player.token
    else
    end
  end


end
