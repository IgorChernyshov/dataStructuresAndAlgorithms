//
//  Node.swift
//  LinkedList
//
//  Created by Игорь Чернышов on 28.12.2023.
//

final class Node<Value> {
	var value: Value
	var next: Node?

	init(value: Value, next: Node? = nil) {
		self.value = value
		self.next = next
	}
}

extension Node: CustomStringConvertible {
	var description: String {
		guard let next else { return "\(value)" }
		return "\(value) -> \(String(describing: next)) "
	}
}
