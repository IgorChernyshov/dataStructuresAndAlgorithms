//
//  HeapSort.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

extension Heap {

	func sorted() -> [Element] {
		var heap = Heap(elements: elements, sort: sort)
		for index in heap.elements.indices.reversed() {
			heap.elements.swapAt(0, index)
			heap.siftDown(from: 0, upTo: index)
		}
		return heap.elements
	}
}
