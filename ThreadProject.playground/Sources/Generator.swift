import Foundation

public class Generator: Thread {
    private let keeper: Keeper

    public init(keeper: Keeper) {
        self.keeper = keeper
    }

    public override func main() {
        RunLoop.current.add(createTimer(), forMode: .common)
        RunLoop.current.run(until: .now + 20)
    }

    @objc func chipMaked() {
        keeper.added(value: Chip.make())
    }

    public func createTimer() -> Timer {
        let timeInterval: Double = 2
        let repeats = true
        let timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(chipMaked), userInfo: nil, repeats: repeats)
        return timer
    }
}
