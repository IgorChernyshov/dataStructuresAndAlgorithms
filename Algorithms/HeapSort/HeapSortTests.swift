//
//  HeapSortTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 05.02.2024.
//

struct HeapSortTests {

	func runTests() {
		testSortHeap()
	}

	private func testSortHeap() {
		let heap = Heap(elements: [2, 5, 6, 8, 9, 12, 18, 21, 26], sort: >)
		print("Unsorted heap: ", heap)
		print("Sorted heap: ", heap.sorted())
	}
}
