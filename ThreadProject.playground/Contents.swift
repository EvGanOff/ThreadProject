import UIKit

var keeper = Keeper()
let generator = Generator(keeper: keeper)
let worker = Worker(keeper: keeper)

generator.start()
worker.start()
