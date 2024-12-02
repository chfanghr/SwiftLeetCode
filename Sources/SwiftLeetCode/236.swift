public class LowestCommonAncestorOfABinaryTree {
  public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
      self.val = val
      self.left = nil
      self.right = nil
    }
  }

  public class OurTreeNode {
    public var hasP: Bool = false
    public var hasQ: Bool = false
    public var left, right: OurTreeNode?
    public var treeNode: TreeNode?
  }

  public static func treeNodeToOurs(_ node: TreeNode?, _ p: Int, _ q: Int) -> OurTreeNode? {
    guard let node = node else {
      return nil
    }

    let ourTreeNode = OurTreeNode()

    ourTreeNode.treeNode = node
    ourTreeNode.left = treeNodeToOurs(node.left, p, q)
    ourTreeNode.right = treeNodeToOurs(node.right, p, q)
    ourTreeNode.hasP =
      node.val == p || (ourTreeNode.left?.hasP ?? false) || (ourTreeNode.right?.hasP ?? false)
    ourTreeNode.hasQ =
      node.val == q || (ourTreeNode.left?.hasQ ?? false) || (ourTreeNode.right?.hasQ ?? false)

    return ourTreeNode
  }

  public static func findLCA(_ node: OurTreeNode?) -> OurTreeNode? {
    guard let node = node else {
      return nil
    }

    if node.hasP && node.hasQ {
      if let retNode = findLCA(node.left) {
        return retNode
      }

      if let retNode = findLCA(node.right) {
        return retNode
      }

      return node
    } else {
      return nil
    }
  }

  public static func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?)
    -> TreeNode?
  {
    guard let root = root, let p = p, let q = q else {
      return nil
    }

    let ourRoot = treeNodeToOurs(root, p.val, q.val)
    return findLCA(ourRoot)?.treeNode
  }
}
