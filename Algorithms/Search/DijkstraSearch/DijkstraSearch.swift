//
//  DijkstraSearch.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 08.02.2024.
//

enum Visit<T: Hashable> {
	case start
	case edge(Edge<T>)
}

final class Dijkstra<T: Hashable> {

	typealias Graph = AdjacencyList<T>

	let graph: Graph

	init(graph: Graph) {
		self.graph = graph
	}

	func shortestPath(from start: Vertex<T>) -> [Vertex<T>: Visit<T>] {
		var paths: [Vertex<T> : Visit<T>] = [start: .start]
		var priorityQueue = PriorityQueue<Vertex<T>> {
			self.distance(to: $0, with: paths) < self.distance(to: $1, with: paths)
		}
		priorityQueue.enqueue(start)

		while let vertex = priorityQueue.dequeue() {
			for edge in graph.edges(from: vertex) {
				guard let weight = edge.weight else { continue }
				if paths[edge.destination] == nil ||
					distance(to: vertex, with: paths) + weight < distance(to: edge.destination, with: paths) {
					paths[edge.destination] = .edge(edge)
					priorityQueue.enqueue(edge.destination)
				}
			}
		}

		return paths
	}

	func shortestPath(to destination: Vertex<T>, paths: [Vertex<T> : Visit<T>]) -> [Edge<T>] {
		route(to: destination, with: paths)
	}
}

private extension Dijkstra {

	func route(to destination: Vertex<T>, with paths: [Vertex<T> : Visit<T>]) -> [Edge<T>] {
		var vertex = destination
		var path = [Edge<T>]()

		while let visit = paths[vertex], case .edge(let edge) = visit {
			path = [edge] + path
			vertex = edge.source
		}

		return path
	}

	func distance(to destination: Vertex<T>, with paths: [Vertex<T> : Visit<T>]) -> Double {
		let path = route(to: destination, with: paths)
		let distances = path.compactMap { $0.weight }
		return distances.reduce(0.0, +)
	}
}
