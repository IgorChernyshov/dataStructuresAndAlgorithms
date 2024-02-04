//
//  DoublyLinkedList.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 16.01.2024.
//

final class DoublyLinkedList<Value> {

	private var head: Node<Value>?
	private var tail: Node<Value>?

	init() {}

	var isEmpty: Bool {
		head == nil
	}

	var first: Node<Value>? {
		head
	}

	func append(_ value: Value) {
		let newNode = Node(value: value)

		guard let tailNode = tail else {
			head = newNode
			tail = newNode
			return
		}

		newNode.previous = tailNode
		tailNode.next = newNode
		tail = newNode
	}

	func remove(_ node: Node<Value>) -> Value {
		let prev = node.previous
		let next = node.next

		if let prev = prev {
			prev.next = next
		} else {
			head = next
		}

		next?.previous = prev

		if next == nil {
			tail = prev
		}

		node.previous = nil
		node.next = nil

		return node.value
	}
}

extension DoublyLinkedList: CustomStringConvertible {

	var description: String {
		var string = ""
		var current = head
		while let node = current {
			string.append("\(node.value) -> ")
			current = node.next
		}
		return string + "end"
	}
}

final class DoublyLinkedListIterator<Value>: IteratorProtocol {

	private var current: DoublyLinkedList<Value>.Node<Value>?

	init(node: DoublyLinkedList<Value>.Node<Value>?) {
		current = node
	}

	func next() -> DoublyLinkedList<Value>.Node<Value>? {
		defer { current = current?.next }
		return current
	}
}

extension DoublyLinkedList: Sequence {

	func makeIterator() -> DoublyLinkedListIterator<Value> {
		DoublyLinkedListIterator(node: head)
	}
}
