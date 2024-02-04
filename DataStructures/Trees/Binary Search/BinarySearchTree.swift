//
//  BinarySearchTree.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 20.01.2024.
//

struct BinarySearchTree<Element: Comparable> {

	private(set) var root: BinaryTreeNode<Element>?
	init() {}

	mutating func insert(_ value: Element) {
		root = insert(from: root, value: value)
	}

	private func insert(from node: BinaryTreeNode<Element>?, value: Element) -> BinaryTreeNode<Element> {
		guard let node else { return BinaryTreeNode(value: value) }
		if value < node.value {
			node.leftChild = insert(from: node.leftChild, value: value)
		} else {
			node.rightChild = insert(from: node.rightChild, value: value)
		}
		return node
	}
}

// MARK: - Print
extension BinarySearchTree: CustomStringConvertible {
	var description: String {
		return root?.description ?? "empty tree"
	}
}

// MARK: - Search
extension BinarySearchTree {

	func contains(_ value: Element) -> Bool {
		var current = root
		while let node = current {
			if node.value == value { return true }
			if value < node.value {
				current = node.leftChild
			} else {
				current = node.rightChild
			}
		}
		return false
	}
}

// MARK: - Removal
extension BinarySearchTree {
	mutating func remove(_ value: Element) {
		root = remove(node: root, value: value)
	}

	private func remove(node: BinaryTreeNode<Element>?, value: Element) -> BinaryTreeNode<Element>? {
		guard let node else { return nil }
		if value == node.value {
			if node.leftChild == nil && node.rightChild == nil {
			  return nil
			}
			if node.leftChild == nil {
			  return node.rightChild
			}
			if node.rightChild == nil {
			  return node.leftChild
			}
			node.value = node.rightChild!.min.value
			node.rightChild = remove(node: node.rightChild, value: node.value)
		} else if value < node.value {
			node.leftChild = remove(node: node.leftChild, value: value)
		} else {
			node.rightChild = remove(node: node.rightChild, value: value)
		}
		return node
	}
}

// MARK: - Helpers
private extension BinaryTreeNode {
	var min: BinaryTreeNode {
		leftChild?.min ?? self
	}
}
