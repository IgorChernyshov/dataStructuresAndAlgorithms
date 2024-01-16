//
//  QueueArray.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 01.01.2024.
//

struct QueueArray<Element>: Queue {

	private var array = [Element]()

	init() {}

	@discardableResult
	mutating func enqueue(_ element: Element) -> Bool {
		array.append(element)
		return true
	}

	mutating func dequeue() -> Element? {
		isEmpty ? nil : array.removeFirst()
	}

	var isEmpty: Bool {
		array.isEmpty
	}

	var peek: Element? {
		array.first
	}
}

extension QueueArray: CustomStringConvertible {

	var description: String {
		array.description
	}
}
