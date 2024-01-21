//
//  BinaryTreeTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 20.01.2024.
//

struct BinaryTreeTests {

	func runTests() {
		testPrintTree()
		testInOrderTraverse()
		testPreOrderTraverse()
		testPostOrderTraverse()
	}

	// MARK: - Tests
	private func testPrintTree() {
		let binaryTree = makeBinaryTree()
		print(binaryTree)
	}

	private func testInOrderTraverse() {
		print("In-order traverse")
		let binaryTree = makeBinaryTree()
		binaryTree.traverseInOrder(visit: { print($0) })
	}

	private func testPreOrderTraverse() {
		print("\nPre-order traverse")
		let binaryTree = makeBinaryTree()
		binaryTree.traversePreOrder(visit: { print($0) })
	}

	private func testPostOrderTraverse() {
		print("\nPost-order traverse")
		let binaryTree = makeBinaryTree()
		binaryTree.traversePostOrder(visit: { print($0) })
	}

	// MARK: - Helpers
	private func makeBinaryTree() -> BinaryTreeNode<Int> {
		let zero = BinaryTreeNode(value: 0)
		let one = BinaryTreeNode(value: 1)
		let five = BinaryTreeNode(value: 5)
		let seven = BinaryTreeNode(value: 7)
		let eight = BinaryTreeNode(value: 8)
		let nine = BinaryTreeNode(value: 9)
		seven.leftChild = one
		one.leftChild = zero
		one.rightChild = five
		seven.rightChild = nine
		nine.leftChild = eight
		return seven
	}
}
