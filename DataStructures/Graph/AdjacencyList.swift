//
//  AdjacencyList.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 06.02.2024.
//

class AdjacencyList<T>: Graph {

	typealias Element = T

	init() {}

	private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]

	func createVertex(data: Element) -> Vertex<Element> {
		let vertex = Vertex(index: adjacencies.count, data: data)
		adjacencies[vertex] = []
		return vertex
	}

	func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
		let edge = Edge(source: source, destination: destination, weight: weight)
		adjacencies[source]?.append(edge)
	}
	
	func edges(from source: Vertex<T>) -> [Edge<T>] {
		adjacencies[source] ?? []
	}

	func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
		edges(from: source)
			.first { $0.destination == destination }?
			.weight
	}
}

extension AdjacencyList: CustomStringConvertible {

	var description: String {
		var result = ""
		for (vertex, edges) in adjacencies {
			var edgeString = ""
			for (index, edge) in edges.enumerated() {
				if index != edges.count - 1 {
					edgeString.append("\(edge.destination), ")
				} else {
					edgeString.append("\(edge.destination)")
				}
			}
			result.append("\(vertex) ---> [ \(edgeString) ]\n")
		}
		return result
	}
}
