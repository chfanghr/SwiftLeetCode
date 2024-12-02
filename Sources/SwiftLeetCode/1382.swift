public class BalanceABinarySearchTree {
  public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
      self.val = val
      self.left = left
      self.right = right
    }

    public static var example1: TreeNode {
      return TreeNode(1, nil, TreeNode(2, nil, TreeNode(3, nil, TreeNode(4))))
    }
  }

  public static func balanceBST(_ root: TreeNode?) -> TreeNode? {
    var values = [Int]()
    bstToArr(root, &values)
    values.sort()
    return rebuildBST(nil, values[...])
  }

  public static func bstToArr(_ node: TreeNode?, _ ret: inout [Int]) {
    guard let node = node else {
      return
    }

    ret.append(node.val)
    bstToArr(node.left, &ret)
    bstToArr(node.right, &ret)
  }

  public static func insertIntoBST(_ node: TreeNode?, _ val: Int) -> TreeNode {
    guard let node = node else {
      return TreeNode(val)
    }

    if val < node.val {
      node.left = insertIntoBST(node.left, val)
    } else {
      node.right = insertIntoBST(node.right, val)
    }

    return node
  }

  public static func rebuildBST(_ root: TreeNode?, _ sortedArr: ArraySlice<Int>) -> TreeNode? {
    if sortedArr.isEmpty {
      return root
    }

    let start = sortedArr.indices.first!
    let end = sortedArr.indices.last!
    let mid = (start + end) / 2

    print(start, end, mid)

    let root = insertIntoBST(root, sortedArr[mid])
    _ = Self.rebuildBST(root, sortedArr[start..<mid])
    _ = Self.rebuildBST(root, sortedArr[mid...end].dropFirst())

    return root
  }
}
