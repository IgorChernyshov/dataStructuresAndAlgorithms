//
//  AdjacencyMatrix.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 07.02.2024.
//

final class AdjacencyMatrix<T>: Graph {

	typealias Element = T

	private var vertices: [Vertex<T>] = []
	private var weights: [[Double?]] = []

	init() {}

	func createVertex(data: Element) -> Vertex<Element> {
		let vertex = Vertex(index: vertices.count, data: data)
		vertices.append(vertex)

		for i in 0..<weights.count {
			weights[i].append(nil)
		}
		let row = [Double?](repeating: nil, count: vertices.count)
		weights.append(row)
		return vertex
	}

	func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
		guard source != destination else { return }
		weights[source.index][destination.index] = weight
	}

	func edges(from source: Vertex<T>) -> [Edge<T>] {
		var edges: [Edge<T>] = []
		for column in 0..<weights.count {
			if let weight = weights[source.index][column] {
				edges.append(Edge(source: source, destination: vertices[column], weight: weight))
			}
		}
		return edges
	}

	func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
		weights[source.index][destination.index]
	}
}

extension AdjacencyMatrix: CustomStringConvertible {
	var description: String {
		let verticesDescription = vertices.map { "\($0)" }.joined(separator: "\n")

		var grid: [String] = []
		for i in 0..<weights.count {
			var row = ""
			for j in 0..<weights.count {
				if let value = weights[i][j] {
					row += "\(value)\t"
				} else {
					row += "ø\t\t"
				}
			}
			grid.append(row)
		}
		let edgesDescription = grid.joined(separator: "\n")
		// 3
		return "\(verticesDescription)\n\n\(edgesDescription)"
	}
}
