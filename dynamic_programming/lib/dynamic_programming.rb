class DynamicProgramming
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
    return nil if n > 20
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    frog_cache = {
      1 => [[1]],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
    return frog_cache if n < 4
    (4 .. n).each do |k|
      one_back = frog_cache[k - 3]
      two_back = frog_cache[k - 2]
      three_back = frog_cache[k - 1]

      answer = one_back.map {|arr| arr + [3] }
      answer += two_back.map {|arr| arr + [2] }
      answer += three_back.map {|arr| arr + [1] }
      frog_cache[k] = answer
    end
    frog_cache

    # four = [[1, 1, 1, 1], [1, 1, 2], [1, 2, 1], [2, 1, 1], [3, 1], [1, 3], [2, 2]]
  end

  def frog_hops_top_down(n)
  end

  def super_frog_hops(n, k)
  end

  def make_change(amt, coins)
    return [] if amt == 0
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end

# a = DynamicProgramming.new
# # p a.blair_nums(3)
# # p a.blair_nums(4)
# # p a.blair_nums(100)
#
# p a.frog_hops(4)
