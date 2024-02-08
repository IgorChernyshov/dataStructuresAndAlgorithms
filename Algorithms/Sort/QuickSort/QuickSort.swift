//
//  QuickSort.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 05.02.2024.
//

func quicksortNaive<T: Comparable>(_ a: [T]) -> [T] {
	guard a.count > 1 else { return a }
	let pivot = a[a.count / 2]
	let lessThan = a.filter { $0 < pivot }
	let pivotPoint = a.filter { $0 == pivot }
	let greaterThan = a.filter { $0 > pivot }
	return quicksortNaive(lessThan) + pivotPoint + quicksortNaive(greaterThan)
}

func quicksortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
	if low < high {
		let pivot = partitionLomuto(&a, low: low, high: high)
		quicksortLomuto(&a, low: pivot, high: high - 1)
		quicksortLomuto(&a, low: pivot + 1, high: high)
	}
}

func quicksortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
	if low < high {
		let pivot = partitionHoare(&a, low: low, high: high)
		quicksortHoare(&a, low: low, high: pivot)
		quicksortHoare(&a, low: pivot + 1, high: high)
	}
}

func quicksortMedian<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
	if low < high {
		let pivot = medianOfThree(&a, low: low, high: high)
		quicksortMedian(&a, low: low, high: pivot - 1)
		quicksortMedian(&a, low: pivot + 1, high: high)
	}
}

func quicksortDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
	if low < high {
		let (p, q) = partitionDutchFlag(&a, low: low, high: high, pivotIndex: high)
		quicksortDutchFlag(&a, low: low, high: p - 1)
		quicksortDutchFlag(&a, low: q + 1, high: high)
	}
}

@discardableResult
private func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
	let pivot = a[high]

	var i = low
	for j in low..<high {
		if a[j] <= pivot {
			a.swapAt(i, j)
			i += 1
		}
	}
	a.swapAt(i, high)

	return i
}

@discardableResult
private func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
	let pivot = a[low]
	var i = low - 1
	var j = high + 1

	while true {
		repeat { j -= 1 } while a[j] > pivot
		repeat { i += 1 } while a[i] < pivot

		if i < j {
			a.swapAt(i, j)
		} else {
			return j
		}
	}
}

@discardableResult
private func medianOfThree<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
	let center = (low + high) / 2

	if a[low] > a[center] {
		a.swapAt(low, center)
	}
	if a[low] > a[high] {
		a.swapAt(low, high)
	}
	if a[center] > a[high] {
		a.swapAt(center, high)
	}

	return center
}

@discardableResult
private func partitionDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int, pivotIndex: Int) -> (Int, Int) {
	let pivot = a[pivotIndex]

	var smaller = low
	var equal = low
	var larger = high
	while equal <= larger {
		if a[equal] < pivot {
			a.swapAt(smaller, equal)
			smaller += 1
			equal += 1
		} else if a[equal] == pivot {
			equal += 1
		} else {
			a.swapAt(equal, larger)
			larger -= 1
		}
	}
	return (smaller, larger)
}
