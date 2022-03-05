import UIKit

var mainKeeper = Keeper()
let generator = Generator(keeper: mainKeeper)
let worker = Worker(keeper: mainKeeper)

generator.start()
worker.start()
