import Foundation

func solution(_ babbling:[String]) -> Int {
    let regex = try! NSRegularExpression(pattern: "(aya|ye|woo|ma)?")

    return babbling.map { regex.stringByReplacingMatches(in: $0, range: NSRange(location: 0, length: $0.count), withTemplate: "") }.filter { $0.count == 0 }.count
}