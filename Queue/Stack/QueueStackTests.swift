//
//  QueueStackTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 18.01.2024.
//

struct QueueStackTests {

	func runTests() {
		testCreateQueue()
	}

	private func testCreateQueue() {
		var queue = QueueStack<String>()
		queue.enqueue("Ray")
		queue.enqueue("Brian")
		queue.enqueue("Eric")
		queue.dequeue()
		print(queue)
		print(queue.peek ?? "")
	}
}
