public class BinaryTreeMaxPathSum {
  public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
      self.val = 0
      self.left = nil
      self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
      self.val = val
      self.left = left
      self.right = right
    }

    public static func exampleTree1() -> TreeNode {
      TreeNode(1, TreeNode(2), TreeNode(3))
    }

    public static func exampleTree2() -> TreeNode {
      TreeNode(-10, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
    }

  }

  public static func maxOptionalInts(_ l: Int?, _ r: Int?) -> Int? {
    switch (l, r) {
    case (.some(let l), .none):
      return l
    case (.none, .some(let r)):
      return r
    case (.some(let l), .some(let r)):
      return max(l, r)
    default:
      return nil
    }
  }

  public static func maxPathSum(_ root: TreeNode?) -> Int {

    let (maxSumEndAtRoot, maxSumNotEndAtRoot) = maxPathSumRec(root)

    return Self.maxOptionalInts(maxSumEndAtRoot, maxSumNotEndAtRoot) ?? 0
  }

  public static func maxPathSumRec(
    _ node: TreeNode?
  ) -> (Int?, Int?) {
    guard let node = node else {
      return (nil, nil)
    }

    let (lMaxSumEndAtRoot, lMaxSumNotEndAtRoot) = maxPathSumRec(node.left)
    let lMaxSum = Self.maxOptionalInts(lMaxSumEndAtRoot, lMaxSumNotEndAtRoot)

    let (rMaxSumEndAtRoot, rMaxSumNotEndAtRoot) = maxPathSumRec(node.right)
    let rMaxSum = Self.maxOptionalInts(rMaxSumEndAtRoot, rMaxSumNotEndAtRoot)

    let maxSumEndAtRoot = Self.maxOptionalInts(
      node.val,
      Self.maxOptionalInts(
        // l -> root
        (lMaxSumEndAtRoot ?? 0) + node.val,
        // r -> root
        (rMaxSumEndAtRoot ?? 0) + node.val
      ))
    let maxSumNotEndAtRoot = Self.maxOptionalInts(
      // l -> root -> r
      (lMaxSumEndAtRoot ?? 0) + node.val + (rMaxSumEndAtRoot ?? 0),
      Self.maxOptionalInts(lMaxSum, rMaxSum)
    )

    let ret = (maxSumEndAtRoot, maxSumNotEndAtRoot)

    return ret
  }
}
