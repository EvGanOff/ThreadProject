import Foundation

public class Worker: Thread {
    private let keeperInWorker: Keeper

    public init(keeper: Keeper) {
        self.keeperInWorker = keeper
    }

    public override func main() {
        repeat {
            Worker.sleep(forTimeInterval: 2)
            keeperInWorker.removed()
        } while keeperInWorker.isOpen || keeperInWorker.keeper.isEmpty
    }
}
