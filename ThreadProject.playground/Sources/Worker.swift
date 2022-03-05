import Foundation

public class Worker: Thread {
    public let keeper: Keeper

    public init(keeper: Keeper) {
        self.keeper = keeper
    }

    public func myChipMaker() {
        while true {
            while (!keeper.isOpen) {
                keeper.condition.wait()
            }
            keeper.removed().sodering()
            print("Chip создан")
            if keeper.isEmpty {
                keeper.isOpen = false
            }
        }
    }
    
}
