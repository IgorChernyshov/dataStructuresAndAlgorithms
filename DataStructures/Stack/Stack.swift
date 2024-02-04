//
//  Stack.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 30.12.2023.
//

struct Stack<Element> {

	private var storage = [Element]()

	init() {}

	// MARK: - Canonical
	mutating func push(_ element: Element) {
		storage.append(element)
	}

	@discardableResult
	mutating func pop() -> Element? {
		storage.popLast()
	}

	// MARK: - Helpers
	func peek() -> Element? {
		storage.last
	}

	var isEmpty: Bool {
		peek() == nil
	}

	init(_ elements: [Element]) {
		storage = elements
	}
}

extension Stack: ExpressibleByArrayLiteral {
	init(arrayLiteral elements: Element...) {
		storage = elements
	}
}

extension Stack: CustomStringConvertible {

	var description: String {
		"""
		---Top---
		\(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
		---------
		"""
	}
}
