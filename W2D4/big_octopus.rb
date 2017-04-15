class BigOctopus
FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
TILES = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  def initialize
  end

  def sluggish
    longest_fish = ''
    FISH.length.times do |i|
      FISH.length.times do |j|
        longest_fish = FISH[i] if FISH[i].length > FISH[j].length &&
        FISH[i].length > longest_fish.length
      end
    end
    longest_fish
  end

  def dominant
    #mergesort in descending order, then take first element
    copy = FISH.mergesort
    copy.first
  end

  def clever
    FISH.inject do |acc, el|
      if el.length > acc.length
        el
      else
        acc
      end
    end
  end

  def slow_dance(dir)
    TILES.each_with_index do |tile, i|
      return i if dir == tile
    end
  end

  tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

  def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
  end

end

class Array
  def mergesort(&prc)
    return self if self.length <= 1
    mid = length / 2
    sorted_left = self.take(mid).mergesort(&prc)
    sorted_right = self.drop(mid).mergesort(&prc)
    merge(sorted_left, sorted_right, &prc)
  end

  def merge(left, right, &prc)
    prc ||= Proc.new { |x, y| y.length <=> x.length }
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end
    end

    result + left + right
  end
end
p BigOctopus.new.dominant

p BigOctopus.new.clever

p BigOctopus.new.slow_dance("right-down")
