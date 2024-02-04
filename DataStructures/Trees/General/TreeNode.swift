//
//  TreeNode.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 20.01.2024.
//

final class TreeNode<T> {

	var value: T
	var children = [TreeNode]()

	init(_ value: T) {
		self.value = value
	}

	func add(_ child: TreeNode) {
		children.append(child)
	}
}

// MARK: - Traversal
extension TreeNode {

	func forEachDepthFirst(visit: (TreeNode) -> Void) {
		visit(self)
		children.forEach {
			$0.forEachDepthFirst(visit: visit)
		}
	}

	func forEachLevelOrder(visit: (TreeNode) -> Void) {
		visit(self)
		var queue = QueueStack<TreeNode>()
		children.forEach { queue.enqueue($0) }
		while let node = queue.dequeue() {
			visit(node)
			node.children.forEach { queue.enqueue($0) }
		}
	}
}

// MARK: - Search
extension TreeNode where T: Equatable {

	func search(_ value: T) -> TreeNode? {
		var result: TreeNode?
		forEachLevelOrder { node in
			if node.value == value {
				result = node
				return
			}
		}
		return result
	}
}
