//
//  QueueArrayTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 01.01.2024.
//

struct QueueArrayTests {

	func runTests() {
		testCreateQueue()
	}

	private func testCreateQueue() {
		var queue = QueueArray<String>()
		queue.enqueue("Lol")
		queue.enqueue("Kek")
		queue.enqueue("Cheburek")
		print(queue)
	}
}
