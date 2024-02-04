//
//  Queue.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 01.01.2024.
//

protocol Queue {
	associatedtype Element
	mutating func enqueue(_ element: Element) -> Bool
	mutating func dequeue() -> Element?
	var isEmpty: Bool { get }
	var peek: Element? { get }
}
