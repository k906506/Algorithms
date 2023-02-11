import Foundation

func solution(_ slice:Int, _ n:Int) -> Int {
    return n / slice + (n % slice == 0 ? 0 : 1)
}
