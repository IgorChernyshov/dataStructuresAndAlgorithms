//
//  HeapTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 03.02.2024.
//

struct HeapTests {

	func runTests() {
		testCreateHeap()
	}

	private func testCreateHeap() {
		var heap = Heap(elements: [1,12,3,4,1,6,8,7], sort: >)
		while !heap.isEmpty {
			print(heap.remove()!)
		}
	}
}
