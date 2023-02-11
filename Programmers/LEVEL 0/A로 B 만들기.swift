import Foundation

func solution(_ before:String, _ after:String) -> Int {
    return before.map { $0 }.sorted() == after.map { $0 }.sorted() ? 1 : 0
}