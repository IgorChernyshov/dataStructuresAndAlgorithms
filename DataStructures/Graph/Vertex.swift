//
//  Vertex.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 06.02.2024.
//

struct Vertex<T> {
	let index: Int
	let data: T
}

extension Vertex: Hashable {

	func hash(into hasher: inout Hasher) {
		hasher.combine(index)
	}

	static func == (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
		lhs.index == rhs.index
	}
}

extension Vertex: CustomStringConvertible {
	var description: String { "\(index): \(data)" }
}
