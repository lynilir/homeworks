class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[0]
    left = array.drop(1).select{|el| el <= pivot }
    right = array.drop(1).select{|el| el > pivot }
    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return array if length <= 1

    pivot_idx = partition(array, start, length, &prc)

    left = pivot_idx - start
    right = length - (left + 1)
    # sorts left of same array
    QuickSort.sort2!(array, start, left, &prc)

    # sorts right of same array
    QuickSort.sort2!(array, pivot_idx + 1, right, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    pivot_idx = start
    pivot = array[start]

    ((start + 1)..(start + length - 1)).each do |idx|
      if prc.call(pivot, array[idx]) > 0
        array[idx], array[pivot_idx + 1] = array[pivot_idx + 1], array[idx]
        pivot_idx += 1
      end
    end
    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx
  end
end


a = [3,6,7,3,2,1,9]
p QuickSort.sort1(a)
p QuickSort.sort2!(a)
