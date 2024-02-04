//
//  DoublyLinkedList.Node.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 16.01.2024.
//

extension DoublyLinkedList {

	final class Node<Value>: CustomStringConvertible {

		var value: Value
		var next: Node?
		var previous: Node?

		init(value: Value) {
			self.value = value
		}

		var description: String {
			String(describing: value)
		}
	}
}
