//
//  Edge.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 06.02.2024.
//

struct Edge<T> {
	let source: Vertex<T>
	let destination: Vertex<T>
	let weight: Double?
}
