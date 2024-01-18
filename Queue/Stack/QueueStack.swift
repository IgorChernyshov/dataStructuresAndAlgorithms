//
//  QueueStack.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 18.01.2024.
//

struct QueueStack<T> : Queue {

	private var leftStack = [T]()
	private var rightStack = [T]()

	init() {}

	var isEmpty: Bool {
		leftStack.isEmpty && rightStack.isEmpty
	}

	var peek: T? {
		!leftStack.isEmpty ? leftStack.last : rightStack.last
	}

	@discardableResult
	mutating func enqueue(_ element: T) -> Bool {
		rightStack.append(element)
		return true
	}

	@discardableResult
	mutating func dequeue() -> T? {
		if leftStack.isEmpty {
			leftStack = rightStack.reversed()
			rightStack.removeAll()
		}
		return leftStack.popLast()
	}
}

extension QueueStack: CustomStringConvertible {
	var description: String {
		let printList = leftStack + rightStack.reversed()
		return printList.description
	}
}
