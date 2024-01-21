//
//  BinaryTreeNode.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 20.01.2024.
//

final class BinaryTreeNode<Element> {

	var value: Element

	var leftChild: BinaryTreeNode?
	var rightChild: BinaryTreeNode?

	init(value: Element) {
		self.value = value
	}
}

// MARK: - Print
extension BinaryTreeNode: CustomStringConvertible {
	var description: String {
		diagram(for: self)
	}

	private func diagram(for node: BinaryTreeNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
		guard let node = node else {
			return root + "x\n"
		}
		if node.leftChild == nil && node.rightChild == nil {
			return root + "\(node.value)\n"
		}
		return diagram(for: node.rightChild, top + "  ", top + "┌──", top + "│ ")
			+ root
			+ "\(node.value)\n" 
			+ diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + "  ")
	}
}

// MARK: - Traverse
extension BinaryTreeNode {
	func traverseInOrder(visit: (Element) -> Void) {
		leftChild?.traverseInOrder(visit: visit)
		visit(value)
		rightChild?.traverseInOrder(visit: visit)
	}

	func traversePreOrder(visit: (Element) -> Void) {
		visit(value)
		leftChild?.traversePreOrder(visit: visit)
		rightChild?.traversePreOrder(visit: visit)
	}

	func traversePostOrder(visit: (Element) -> Void) {
		leftChild?.traversePostOrder(visit: visit)
		rightChild?.traversePostOrder(visit: visit)
		visit(value)
	}
}
