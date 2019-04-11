module Players
  class Computer < Player

    def move(board)
      #first find all open spots
      location = 1
      open_spots =[]
      board.cells.each do
        if board.taken?(location)
        else
          open_spots << location.to_s
        end # end of if else
        location += 1
      end # end of do loop

      options_size=open_spots.size
      comp_choice=rand(1...options_size)
      final_choice=open_spots[comp_choice-1]
      return final_choice
    end
  end
end
