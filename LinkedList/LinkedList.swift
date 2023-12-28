//
//  LinkedList.swift
//  LinkedList
//
//  Created by Игорь Чернышов on 28.12.2023.
//

struct LinkedList<Value> {
	var head: Node<Value>?
	var tail: Node<Value>?

	var isEmpty: Bool {
		head == nil
	}

	func node(at index: Int) -> Node<Value>? {
		var currentNode = head
		var currentIndex = 0

		while currentNode != nil && currentIndex < index {
			currentNode = currentNode?.next
			currentIndex += 1
		}

		return currentNode
	}

	mutating func push(_ value: Value) {
		copyNodes()

		head = Node(value: value, next: head)
		if tail == nil {
			tail = head
		}
	}

	mutating func append(_ value: Value) {
		copyNodes()

		guard !isEmpty else {
			push(value)
			return
		}
		tail?.next = Node(value: value)
		tail = tail?.next
	}

	@discardableResult
	mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value>? {
		copyNodes()

		guard tail !== node else {
			append(value)
			return tail
		}
		node.next = Node(value: value, next: node.next)
		return node.next
	}

	@discardableResult
	mutating func pop() -> Value? {
		copyNodes()

		defer {
			head = head?.next
			if isEmpty {
				tail = nil
			}
		}
		return head?.value
	}

	@discardableResult
	mutating func removeLast() -> Value? {
		guard let head else { return nil }
		copyNodes()

		guard head.next != nil else { return pop() }

		var previous = head
		var current = head
		while let next = current.next {
			previous = current
			current = next
		}

		previous.next = nil
		tail = previous
		return current.value
	}

	@discardableResult
	mutating func remove(after node: Node<Value>) -> Value? {
		copyNodes()

		defer {
			if node.next === tail {
				tail = node
			}
			node.next = node.next?.next
		}
		return node.next?.value
	}

	private mutating func copyNodes() {
		guard !isKnownUniquelyReferenced(&head) else { return }

		guard var oldNode = head else { return }
		head = Node(value: oldNode.value)

		var newNode = head
		while let oldNodeNext = oldNode.next {
			newNode?.next = Node(value: oldNodeNext.value)
			newNode = newNode?.next

			oldNode = oldNodeNext
		}

		tail = newNode
	}
}

extension LinkedList: CustomStringConvertible {
	var description: String {
		guard let head else { return "Empty list" }
		return String(describing: head)
	}
}

extension LinkedList: Collection {

	struct Index: Comparable {

		var node: Node<Value>?

		static func ==(lhs: Index, rhs: Index) -> Bool {
			switch (lhs.node, rhs.node) {
			case let (left?, right?):
				return left.next === right.next
			case (nil, nil):
				return true
			default:
				return false
			}
		}

		static func <(lhs: Index, rhs: Index) -> Bool {
			guard lhs != rhs else { return false }
			let nodes = sequence(first: lhs.node) { $0?.next }
			return nodes.contains { $0 === rhs.node }
		}
	}

	var startIndex: Index {
	  return Index(node: head)
	}

	var endIndex: Index {
	  return Index(node: tail?.next)
	}

	func index(after i: Index) -> Index {
	  return Index(node: i.node?.next)
	}

	subscript(position: Index) -> Value {
	  return position.node!.value
	}
}
