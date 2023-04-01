import Foundation

extension Array where Element: Equatable {
    var unique: [Element] {
        return reduce([Element]()) { $0.contains($1) ? $0 : $0 + [$1] }
    }
}

extension Array where Element: Equatable {
  mutating func remove(value: Element) {
    if let i = self.firstIndex(of: value) {
      self.remove(at: i)
    }
  }
}
