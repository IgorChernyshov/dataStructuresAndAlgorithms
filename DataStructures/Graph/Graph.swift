//
//  Graph.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 06.02.2024.
//

enum EdgeType {
	case directed
	case undirected
}

protocol Graph {

	associatedtype Element

	func createVertex(data: Element) -> Vertex<Element>
	func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
	func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
	func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
	func edges(from source: Vertex<Element>) -> [Edge<Element>]
	func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}

extension Graph {

	func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
		switch edge {
		case .directed: addDirectedEdge(from: source, to: destination, weight: weight)
		case .undirected: addUndirectedEdge(between: source, and: destination, weight: weight)
		}
	}

	func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
		addDirectedEdge(from: source, to: destination, weight: weight)
		addDirectedEdge(from: destination, to: source, weight: weight)
	}
}
