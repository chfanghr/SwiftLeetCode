public class Pow {
  public static func myPow(_ x: Double, _ n: Int) -> Double {
    let x = Self.myPow(x, UInt(exactly: abs(n))!)

    if n >= 0 {
      return x
    } else {
      return 1 / x
    }
  }

  public static func myPow(_ x: Double, _ n: UInt) -> Double {
    if n == 0 {
      return 1.0
    } else if n == 1 {
      return x
    } else {
      let nIsOdd = n % 2 == 1
      let square_root = myPow(x, n / 2)
      return square_root * square_root * (nIsOdd ? x : 1.0)
    }
  }
}
