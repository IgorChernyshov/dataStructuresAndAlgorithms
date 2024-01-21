//
//  BinarySearchTreeTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 20.01.2024.
//

struct BinarySearchTreeTests {

	func runTests() {
		testMakeUnbalancedTree()
		testMakeBalancedTree()
		testSearchInTree()
		testRemoveValue()
	}

	// MARK: - Tests
	private func testMakeUnbalancedTree() {
		print("Make unbalanced tree")
		var binarySearchTree = BinarySearchTree<Int>()
		for index in 0..<5 {
			binarySearchTree.insert(index)
		}
		print(binarySearchTree)
	}

	private func testMakeBalancedTree() {
		print("Make balanced tree")
		print(balancedTree)
	}

	private func testSearchInTree() {
		let value = 5
		print("Search \(value) in balanced tree")

		if balancedTree.contains(value) {
			print("Found \(value)!")
		} else {
			print("Couldn't find \(value)")
		}
	}

	private func testRemoveValue() {
		let value = 3
		print("\nRemove \(value) from balanced tree")

		var tree = balancedTree
		print("Tree before removal:")
		print(tree)
		tree.remove(value)
		print("Tree after removing \(value):")
		print(tree)
	}

	// MARK: - Helpers
	private var balancedTree: BinarySearchTree<Int> {
		var binarySearchTree = BinarySearchTree<Int>()
		binarySearchTree.insert(3)
		binarySearchTree.insert(1)
		binarySearchTree.insert(4)
		binarySearchTree.insert(0)
		binarySearchTree.insert(2)
		binarySearchTree.insert(5)
		return binarySearchTree
	}
}
