//
//  BubbleSortTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

struct BubbleSortTests {

	func runTests() {
		testSortArray()
	}

	private func testSortArray() {
		var array = [9, 4, 10, 3]
		print("Original: \(array)")
		bubbleSort(&array)
		print("Bubble sorted: \(array)")
	}
}
