public class BinaryTreeLevelOrderTraversal {
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

  public static func treeHeight(_ node: TreeNode?) -> Int {
    guard let node = node else {
      return 0
    }

    return 1 + max(treeHeight(node.left), treeHeight(node.right))
  }

  public static func levelOrderGo(_ node: TreeNode?, _ level: Int, _ ret: inout [[Int]]) {
    guard let node = node else {
      return
    }

    ret[level].append(node.val)

    Self.levelOrderGo(node.left, level + 1, &ret)
    Self.levelOrderGo(node.right, level + 1, &ret)
  }

  public static func levelOrder(_ root: TreeNode?) -> [[Int]] {
    let treeHeight = treeHeight(root)
    var ret = [[Int]](repeating: [], count: treeHeight)

    Self.levelOrderGo(root, 0, &ret)

    return ret
  }
}
