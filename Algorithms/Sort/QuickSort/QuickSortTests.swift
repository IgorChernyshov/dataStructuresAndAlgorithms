//
//  QuickSortTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 06.02.2024.
//

struct QuickSortTests {

	func runTests() {
		testNaiveSort()
		testLomutoSort()
		testHoareSort()
		testMedianSort()
		testDutchFlagSort()
	}

	private func testNaiveSort() {
		let array = [9, 4, 10, 3, 1]
		print("Original: \(array)")
		let sortedArray = quicksortNaive(array)
		print("Quicksorted (naive): \(sortedArray)")
	}

	private func testLomutoSort() {
		var array = [9, 4, 10, 3, 1]
		print("Original: \(array)")
		quicksortLomuto(&array, low: array.startIndex, high: array.endIndex - 1)
		print("Quicksorted (lomuto): \(array)")
	}

	private func testHoareSort() {
		var array = [9, 4, 10, 3, 1]
		print("Original: \(array)")
		quicksortHoare(&array, low: array.startIndex, high: array.endIndex - 1)
		print("Quicksorted (hoare): \(array)")
	}

	private func testMedianSort() {
		var array = [9, 4, 10, 3, 1]
		print("Original: \(array)")
		quicksortMedian(&array, low: array.startIndex, high: array.endIndex - 1)
		print("Quicksorted (median): \(array)")
	}

	private func testDutchFlagSort() {
		var array = [9, 4, 10, 3, 1]
		print("Original: \(array)")
		quicksortDutchFlag(&array, low: array.startIndex, high: array.endIndex - 1)
		print("Quicksorted (dutch flag): \(array)")
	}
}
