import Foundation

func solution(_ angle:Int) -> Int {
    switch angle {
        case 0...89:
            return 1
        case 90:
            return 2
        case 90...179:
            return 3
        default:
            return 4
    }
}
