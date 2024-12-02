public class BinaryTreeZigzagLevelOrderTraversal {
  public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
      self.val = 0
      self.left = nil
      self.right = nil
    }
    public init(_ val: Int) {
      self.val = val
      self.left = nil
      self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
      self.val = val
      self.left = left
      self.right = right
    }
  }

  public static func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    var result = [[Int]]()
    var thisLevelNodes = [root]

    var order = true  // true : l -> r, false: r -> l

    while !thisLevelNodes.isEmpty {
      var nextLevelNodes = [TreeNode?]()
      var thisLevelResult = [Int]()

      for thisLevelNode in thisLevelNodes {
        guard let thisLevelNode = thisLevelNode else {
          continue
        }

        thisLevelResult.append(thisLevelNode.val)

        if order {
          nextLevelNodes.append(thisLevelNode.left)
          nextLevelNodes.append(thisLevelNode.right)
        } else {
          nextLevelNodes.append(thisLevelNode.right)
          nextLevelNodes.append(thisLevelNode.left)
        }
      }

      nextLevelNodes.reverse()

      order = !order
      thisLevelNodes = nextLevelNodes
      result.append(thisLevelResult)
    }

    return result.dropLast()
  }

  public static func treeHeight(_ node: TreeNode?) -> Int {
    guard let node = node else {
      return 0
    }

    return 1 + max(treeHeight(node.left), treeHeight(node.right))
  }

  public static func leftToRightLevelOrderRec(_ node: TreeNode?, _ level: Int, _ ret: inout [[Int]])
  {
    guard let node = node else {
      return
    }

    ret[level].append(node.val)

    leftToRightLevelOrderRec(node.left, level + 1, &ret)
    leftToRightLevelOrderRec(node.right, level + 1, &ret)
  }

  public static func zigzagLevelOrder1(_ root: TreeNode?) -> [[Int]] {
    let treeHeight = treeHeight(root)
    var ret = [[Int]](repeating: [], count: treeHeight)

    leftToRightLevelOrderRec(root, 0, &ret)

    var shouldReverse = false

    for offset in ret.indices {
      if shouldReverse {
        ret[offset].reverse()
      }
      shouldReverse = !shouldReverse
    }

    return ret
  }
}
