//
//  MergeSortTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

struct MergeSortTests {

	func runTests() {
		testSortArray()
	}

	private func testSortArray() {
		let array = [9, 4, 10, 3]
		print("Original: \(array)")
		let sortedArray = mergeSort(array)
		print("Merge sorted: \(sortedArray)")
	}
}
