class DynamicProgramming
  attr_reader :cache

  def initialize
    @blair_cache = {
      1 => 1,
      2 => 2
    }
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    temp = blair_nums(n - 1) + blair_nums(n - 2) + (2 * (n) - 1)
    @blair_cache[n] = temp
    return temp
  end

  def frog_hops(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    frog_cache = {
      1 => [1],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
  end

  def frog_hops_top_down(n)
  end

  def super_frog_hops(n, k)
  end

  def make_change(amt, coins)
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end

# a = DynamicProgramming.new
# p a.blair_nums(3)
# p a.blair_nums(4)
# p a.blair_nums(100)
