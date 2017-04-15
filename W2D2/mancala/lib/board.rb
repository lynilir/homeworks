class Board
  attr_accessor :cups
  attr_reader :grid

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(0,13) &&
    !@cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones_in_hand = @cups[start_pos].length
    @cups[start_pos] = []
    # until stones_in_hand == 0
    #
    # end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? {|cup| cup.empty? } ||
      @cups[6..13].all? { |cup| cup.empty? }
    false
  end

  def winner
  end
end
