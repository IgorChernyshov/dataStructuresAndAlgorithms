//
//  RadixSortTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

struct RadixSortTests {

	func runTests() {
		testSortArray()
	}

	private func testSortArray() {
		var array = [88, 410, 1772, 20]
		print("Original: \(array)")
		array.radixSort()
		print("Radix sorted: \(array)")
	}
}
