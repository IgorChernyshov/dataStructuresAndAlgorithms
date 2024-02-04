//
//  PriorityQueueTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

struct PriorityQueueTests {

	func runTests() {
		testCreateAndDepleteQueue()
	}

	private func testCreateAndDepleteQueue() {
		var priorityQueue = Heap(elements: [1,12,3,4,1,6,8,7], sort: >)
		while !priorityQueue.isEmpty {
			print(priorityQueue.remove()!)
		}
	}
}
