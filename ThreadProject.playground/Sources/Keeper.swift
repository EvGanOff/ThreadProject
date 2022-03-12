import Foundation

public class Keeper {
    public var keeper = [Chip]()
    var semaphore = DispatchSemaphore(value: 1)
    var isOpen = false

    public init() {}

    public var isEmpty: Bool {
        keeper.isEmpty
    }

    public func removed()  {
        while !isOpen {
            semaphore.wait()
        }
        let chip = keeper.removeFirst()
        semaphore.signal()
        chip.sodering()
        print("Создан Чип")
        if keeper.isEmpty {
            isOpen = false
        }
    }

    public func added(value: Chip) {
        semaphore.wait()
        keeper.append(value)
        isOpen = true
        semaphore.signal()
        print("Поступила подложка для чипа")
    }
}
