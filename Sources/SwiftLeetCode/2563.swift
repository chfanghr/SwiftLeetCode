public class CountFairPair {
  public static func countFairPairs(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
    let bst = BST<Int>.from_arr(nums)

    var count = 0

    var cache = [Int: Int]()

    for num in nums {
      if let this_count = cache[num] {
        count += this_count
      } else {
        let lower = lower - num
        let upper = upper - num

        var this_count = bst.get_number_of_values_in_range(lower: lower, upper: upper)
        if lower <= num && num <= upper {
          this_count -= 1
        }
        
        count += this_count

        cache[num] = this_count
      }
    }

    return count / 2
  }

  struct BST<T: Comparable> {
    var root: Node<T>?

    mutating func insert(elem: T) {
      if let root = self.root {
        root.insert(elem)
      } else {
        self.root = .init(elem)
      }
    }

    func get_number_of_values_in_range(lower: T, upper: T) -> Int {
      return root?.get_number_of_values_in_range(lower: lower, upper: upper) ?? 0
    }

    static func from_arr(_ arr: [T]) -> Self {
      var bst = BST<T>()

      for elem in arr {
        bst.insert(elem: elem)
      }

      return bst
    }
  }

  class Node<T: Comparable> {
    init(
      _ val: T,
      _ duplicates: Int = 1,
      left: Node<T>? = nil,
      right: Node<T>? = nil
    ) {
      self.value = val
      self.left = left
      self.right = right
      self.duplicates = duplicates

      left_count =
        if let left = self.left {
          left.left_count + left.duplicates
        } else {
          0
        }
    }

    var value: T
    var duplicates: Int

    var left: Node?
    var right: Node?

    private(set) var left_count: Int

    func insert(_ elem: T) {
      if elem == self.value {
        self.duplicates += 1
      } else if elem < self.value {
        if let left = self.left {
          left.insert(elem)
        } else {
          self.left = .init(elem)
        }
        self.left_count += 1
      } else {
        if let right = self.right {
          right.insert(elem)
        } else {
          self.right = .init(elem)
        }
      }
    }

    func get_number_of_values_lt(_ target: T) -> Int {
      if self.value < target {
        return duplicates + self.left_count + (self.right?.get_number_of_values_lt(target) ?? 0)
      } else {
        return self.left?.get_number_of_values_lt(target) ?? 0
      }
    }

    func get_number_of_values_le(_ target: T) -> Int {
      if self.value <= target {
        return duplicates + self.left_count + (self.right?.get_number_of_values_le(target) ?? 0)
      } else {
        return self.left?.get_number_of_values_le(target) ?? 0
      }
    }

    func get_number_of_values_in_range(lower: T, upper: T) -> Int {
      let le_upper_count = self.get_number_of_values_le(upper)
      let lt_lower_count = self.get_number_of_values_lt(lower)
      return le_upper_count - lt_lower_count
    }
  }
}
