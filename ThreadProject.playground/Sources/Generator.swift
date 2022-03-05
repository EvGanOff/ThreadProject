import Foundation

public class Generator: Thread {
    let keeper: Keeper

    public init(keeper: Keeper) {
        self.keeper = keeper
    }

    public func myChipMaker() {
        let timeInterval: Double = 2
        let repeats = true
        let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: repeats) { _ in
            self.keeper.added(value: Chip.make())
            print("Chip создается")
        }

        RunLoop.current.add(timer, forMode: .common)
        RunLoop.current.run(until: .now + 20)
    }
}
