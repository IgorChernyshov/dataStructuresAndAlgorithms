//
//  BinarySearchTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 02.02.2024.
//

struct BinarySearchTests {

	func runTests() {
		testBinarySearch()
	}

	private func testBinarySearch() {
		let array = [1, 2, 3, 4, 5, 10, 20, 40, 80, 160]
		print(array.binarySearch(for: 160, in: nil) ?? "nil")
	}
}
