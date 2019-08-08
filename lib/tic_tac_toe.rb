class TicTacToe

  def initialize(board = Array.new(9, " ") )
    @board = board
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
     number.to_i - 1
  end

  def move(index, player = "X")
    if !position_taken?(index)
        @board[index] = player
    else
      return false
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index <= 8 && index >= 0 && @board[index] == " "
      return true
    else
      return false
    end
  end

  def turn
    puts " please enter a number between 1 - 9 to play ! "
    number = gets

    numberconv = input_to_index(number)
    while !valid_move?(numberconv)
        puts "There was an error, please make sure to put number between 1-9 and the place is shulde be empty"
        number = gets
        numberconv = input_to_index(number)
    end
    player = current_player
    move(numberconv, player)
    display_board
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    colone1 = 0
    colone2 = 1
    colone3  = 2
    ligne = 0
    count = 0
    while ligne <= 8

    position1 = WIN_COMBINATIONS[ligne][colone1]
    position2 = WIN_COMBINATIONS[ligne][colone2]
    position3 = WIN_COMBINATIONS[ligne][colone3]

      if @board[position1] == "X" && @board[position2] == "X" && @board[position3] == "X" or ( @board[position1] == "O" && @board[position2] == "O" && @board[position3] == "O" )
        return WIN_COMBINATIONS.fetch(ligne)
        nb4 = 9
      else
        count += 1
        if count == 8
          return false
        end
      end
    ligne += 1
  end
end

    def full?
      count = 0
      @board.each do |values|
        if values == "X" or values == "O"
          count += 1
        end
      end
        if count == 9
          return true
        else
          return false
        end
    end

    def draw?
      if full?
        if !won?
          return true
        else
          return false
        end
      else
        return false
      end
    end

    def over?
        if full? or won?
          return true
        else
          return false
        end
    end

    def winner
      if won?
        positions = won?
        position = positions[0]
        winner = @board[position]
        return winner
      else
        return nil
      end
    end

    def play
      while !over?
        turn
      if won?
        puts "congratulation you won "
      end
      if draw?
        puts " DRAAAW!!"
      end
    end
  end

  
end
