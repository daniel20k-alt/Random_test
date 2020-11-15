import UIKit
import PlaygroundSupport
import GameplayKit

func RandomInt(min: Int, max: Int) -> Int {
    if max < min { return min }
    return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
}

RandomInt(min: 15, max: 20)


print(GKRandomSource.sharedRandom().nextInt(upperBound: 10))


//insignificant performance unless generating vast sources
//GKLinearCongruentialRandomSource - high performance, low random
//GKMersenneTwisterRandomSource - low performance, high random
//GKARC4RandomSource - medium performance, medium random


let arc4 = GKARC4RandomSource()
arc4.nextInt(upperBound: 20)

let mersenne = GKMersenneTwisterRandomSource()
mersenne.nextInt(upperBound: 20)



let cards36 = GKRandomDistribution.init(lowestValue: 1, highestValue: 36)
cards36.nextInt()


//GKShuffledDistribution - ensuring sequences repeat less frequently (will go through each before a repeat), order can't be predicted
//GKGaussianDistribution - bell curve of results, with more mediums

let shuffled = GKShuffledDistribution.d6()
print(shuffled.nextInt())
print(shuffled.nextInt())
print(shuffled.nextInt())
print(shuffled.nextInt())
print(shuffled.nextInt())
print(shuffled.nextInt())


//creating the random source with a specified seed, for synchronization purposes

let fixedBingoBalls = [Int](1...49)
let fixedShuffledBalls = GKMersenneTwisterRandomSource(seed: 1001).arrayByShufflingObjects(in: fixedBingoBalls) //random order but same numbers
print(fixedShuffledBalls[0])
print(fixedShuffledBalls[1])
print(fixedShuffledBalls[2])
print(fixedShuffledBalls[3])
print(fixedShuffledBalls[4])
print(fixedShuffledBalls[5])
