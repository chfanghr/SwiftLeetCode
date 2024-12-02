// class Solution {
//   func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//     var combinations: [Int: Set<[Int: Int]>] = .init()

//     let target_combination = combinations[target]!

//     return Array(
//       target_combination.map {
//         Array(
//           $0.map { (k, v) in
//             [Int](repeating: k, count: v)
//           }.joined())
//       })

//     return []
//   }

//   func combinationSum(_ candidates: [Int], _ target: Int, cache: inout [Int: Set<[Int: Int]>]) -> [[Int]] {
//     for candidate in candidates {
//       let x = target - candidate

//       if x < 0 {
//         continue
//       }

//       if x == 0 {

//       }


//     }
//   }
// }
