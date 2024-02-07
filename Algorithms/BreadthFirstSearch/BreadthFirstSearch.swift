//
//  BreadthFirstSearch.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 07.02.2024.
//

extension Graph {

	func breadthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
		var queue = QueueStack<Vertex<Element>>()
		var enqueued: Set<Vertex<Element>> = []
		var visited: [Vertex<Element>] = []

		queue.enqueue(source)
		enqueued.insert(source)

		while let vertex = queue.dequeue() {
			visited.append(vertex)
			edges(from: vertex).map { $0.destination }.forEach { vertex in
				if !enqueued.contains(vertex) {
					queue.enqueue(vertex)
					enqueued.insert(vertex)
				}
			}
		}

		return visited
	}
}
