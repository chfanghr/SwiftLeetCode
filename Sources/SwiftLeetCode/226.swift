public class InvertBinaryTree {
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

  public static func invertTree(_ root: TreeNode?) {
    guard let root = root else {
      return
    }

    (root.left, root.right) = (root.right, root.left)

    invertTree(root.left)
    invertTree(root.right)
  }
}
