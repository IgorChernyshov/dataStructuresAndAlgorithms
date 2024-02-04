//
//  LinkedListTests.swift
//  LinkedList
//
//  Created by Игорь Чернышов on 28.12.2023.
//

final class LinkedListTests {

	func runTests() {
		testSimpleLinkedNodes()
		testPushToLinkedList()
		testAppendToLinkedList()
		testInsertAfterNodeToLinkedList()
		testPopFromLinkedList()
		testRemoveLastFromLinkedList()
		testRemoveAfterNodeFromLinkedList()
		testAdoptedCollection()
		testCopyOnWrite()
	}

	private func testSimpleLinkedNodes() {
		let node3 = Node(value: 3)
		let node2 = Node(value: 2, next: node3)
		let node1 = Node(value: 1, next: node2)
		print(node1)
	}

	private func testPushToLinkedList() {
		var linkedList = LinkedList<Int>()
		linkedList.push(3)
		linkedList.push(2)
		linkedList.push(1)
		print(linkedList)
	}

	private func testAppendToLinkedList() {
		var linkedList = LinkedList<Int>()
		linkedList.append(1)
		linkedList.append(2)
		linkedList.append(3)
		print(linkedList)
	}

	private func testInsertAfterNodeToLinkedList() {
		var linkedList = LinkedList<Int>()
		linkedList.append(1)
		linkedList.append(2)

		guard let middleNode = linkedList.node(at: 0) else { return }
		linkedList.insert(3, after: middleNode)
		print(linkedList)
	}

	private func testPopFromLinkedList() {
		var list = LinkedList<Int>()
		list.push(3)
		list.push(2)
		list.push(1)
		print("Before popping list: \(list)")
		let poppedValue = list.pop()
		print("After popping list: \(list)")
		print("Popped value: " + String(describing: poppedValue))
	}

	private func testRemoveLastFromLinkedList() {
		var list = LinkedList<Int>()
		list.push(3)
		list.push(2)
		list.push(1)
		print("Before removing last node: \(list)")
		let removedValue = list.removeLast()
		print("After removing last node: \(list)")
		print("Removed value: " + String(describing: removedValue))
	}

	private func testRemoveAfterNodeFromLinkedList() {
		var list = LinkedList<Int>()
		list.push(3)
		list.push(2)
		list.push(1)
		print("Before removing at particular index: \(list)")
		let index = 1
		let node = list.node(at: index - 1)!
		let removedValue = list.remove(after: node)
		print("After removing at index \(index): \(list)")
		print("Removed value:", String(describing: removedValue))
	}

	private func testAdoptedCollection() {
		var list = LinkedList<Int>()
		for i in 0...9 {
			list.append(i)
		}
		print("List:", list)
		print("First element:", list[list.startIndex])
		print("Array containing first 3 elements:", Array(list.prefix(3)))
		print("Array containing last 3 elements:", Array(list.suffix(3)))
		print("Sum of all values:", list.reduce(0, +))
	}

	private func testCopyOnWrite() {
		var list1 = LinkedList<Int>()
		list1.append(1)
		list1.append(2)
		var list2 = list1
		print("List1: \(list1)")
		print("List2: \(list2)")
		print("After appending 3 to list2")
		list2.append(3)
		print("List1: \(list1)")
		print("List2: \(list2)")
	}
}
