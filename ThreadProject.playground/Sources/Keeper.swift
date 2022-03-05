import Foundation

public class Keeper {
    var keeper = [Chip]()
    var condition = NSCondition()
    var isOpen = false

    public init() {}

    public var isEmpty: Bool {
            keeper.isEmpty
    }

    public func removed() -> Chip {
        keeper.removeLast()
    }

    public func added(value: Chip) {
        condition.lock()
        keeper.append(value)
        print("\(keeper.append(value))")
        isOpen = true
        condition.signal()
        condition.unlock()
    }
    
}
