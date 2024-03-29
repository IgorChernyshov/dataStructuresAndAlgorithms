//
//  GraphTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 06.02.2024.
//

struct GraphTests {

	func runTests() {
		testCreateGraph()
	}

	private func testCreateGraph() {
		let graph = AdjacencyList<String>()

		let singapore = graph.createVertex(data: "Singapore")
		let tokyo = graph.createVertex(data: "Tokyo")
		let hongKong = graph.createVertex(data: "Hong Kong")
		let detroit = graph.createVertex(data: "Detroit")
		let sanFrancisco = graph.createVertex(data: "San Francisco")
		let washingtonDC = graph.createVertex(data: "Washington DC")
		let austinTexas = graph.createVertex(data: "Austin Texas")
		let seattle = graph.createVertex(data: "Seattle")

		graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
		graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
		graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
		graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
		graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
		graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
		graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
		graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
		graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
		graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
		graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
		graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

		print("Adjacency matrix breadth first search")
		let vertices = graph.breadthFirstSearch(from: singapore)
		vertices.forEach { vertex in print(vertex) }

		print("\nAdjacency matrix breadth first search")
		let vertices2 = graph.depthFirstSearch(from: singapore)
		vertices2.forEach { vertex in print(vertex) }

		print("\nDijkstra shortest path search")
		let dijkstra = Dijkstra(graph: graph)
		let pathsFromA = dijkstra.shortestPath(from: singapore)
		let path = dijkstra.shortestPath(to: seattle, paths: pathsFromA)
		for edge in path {
			print("\(edge.source) --(\(edge.weight ?? 0.0))--> \(edge.destination)")
		}

		print("\nAdjacency matrix visualisation")
		print(graph)
	}
}
