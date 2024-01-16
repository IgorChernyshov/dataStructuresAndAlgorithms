//
//  QueueLinkedListTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 16.01.2024.
//

struct QueueLinkedListTests {

	func runTests() {
		testCreateQueue()
	}

	private func testCreateQueue() {
		let queue = QueueLinkedList<String>()
		queue.enqueue("Lol")
		queue.enqueue("Kek")
		queue.enqueue("Cheburek")
		queue.dequeue()
		print(queue)
		print(queue.peek ?? "")
	}
}
