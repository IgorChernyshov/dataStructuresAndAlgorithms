//
//  PriorityQueue.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

struct PriorityQueue<Element: Equatable>: Queue {

	private var heap: Heap<Element>

	init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
		heap = Heap(elements: elements, sort: sort)
	}

	var isEmpty: Bool {
		heap.isEmpty
	}

	var peek: Element? {
		heap.peek()
	}

	mutating func enqueue(_ element: Element) -> Bool {
		heap.insert(element)
		return true
	}

	mutating func dequeue() -> Element? {
		heap.remove()
	}
}
