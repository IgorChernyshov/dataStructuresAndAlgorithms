//
//  QueueLinkedList.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 16.01.2024.
//

final class QueueLinkedList<T>: Queue {

	private var list = DoublyLinkedList<T>()

	init() {}

	@discardableResult
	func enqueue(_ element: T) -> Bool {
		list.append(element)
		return true
	}

	@discardableResult
	func dequeue() -> T? {
		guard !list.isEmpty, let element = list.first else {
			return nil
		}
		return list.remove(element)
	}

	var peek: T? {
		list.first?.value
	}

	var isEmpty: Bool {
		list.isEmpty
	}
}

extension QueueLinkedList: CustomStringConvertible {

	var description: String {
		list.description
	}
}
