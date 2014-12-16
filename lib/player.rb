require_relative 'board'
require_relative 'ship'

class Player
 def ship_to_position
    # puts "Which ship would you like to put on the board"
    # ship = STDIN.gets.chomp
    # ship.status == :available ? place_ship_on_board(ship) : "You've already placed that ship"
    # ship_to_position
 end

  def place_ship_on_board(ship)
#     puts "Please select the grid reference where you would like the bow of the ship"
#     grid_ref = STDIN.gets.chomp
#     # test to see if grid ref is empty. Test to see if another boat within 1 sq.

#     puts "Please choose whether you would like to place the ship horizontally or vertically"
#     selection = STDIN.gets.chomp
#     layout = case selection
#               when "horizontally" then @horizontally
#               when "vertically" then @vertically
#               else "please type either 'horizontally' or 'vertically'"

# #need to have rules about position relative to other ships
# #need to have rules about position relative to edge of board
#     ship.placed! at: grid_ref, h_or_v?: layout)
  end

  def move_ship
    #in event that fill board without positioning all ships
    #need to make sure this can't be done after all ships have been positioned
    #and game has startedß
  end

end