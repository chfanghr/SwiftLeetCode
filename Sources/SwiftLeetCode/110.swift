public class BalancedBinaryTree {
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

  static func getBalancedTreeHeight(_ root: TreeNode?) -> Int? {
    guard let root = root else {
      return 0
    }

    guard let lHeight = getBalancedTreeHeight(root.left) else {
      return nil
    }

    guard let rHeight = getBalancedTreeHeight(root.right) else {
      return nil
    }

    let d = abs(lHeight - rHeight)

    if d > 1 {
      return nil
    }

    return max(lHeight, rHeight) + 1
  }

  public static func isBalanced(_ root: TreeNode?) -> Bool {
    Self.getBalancedTreeHeight(root) != nil
  }
}
