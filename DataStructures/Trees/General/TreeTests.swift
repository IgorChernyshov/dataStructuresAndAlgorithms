//
//  TreeTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 20.01.2024.
//

struct TreeTests {

	func runTests() {
		testDepthFirstTraversal()
		testLevelOrderTraversal()
		testSearch()
	}

	// MARK: - Tests
	private func testDepthFirstTraversal() {
		print("Depth-first traversal\n-----")
		let tree = makeBeverageTree()
		tree.forEachDepthFirst { print($0.value) }
	}

	private func testLevelOrderTraversal() {
		print("\nLevel-order traversal\n-----")
		let tree = makeBeverageTree()
		tree.forEachLevelOrder { print($0.value) }
	}

	private func testSearch() {
		print("\nSearch nodes\n-----")
		let tree = makeBeverageTree()
		if let searchResult1 = tree.search("ginger ale") {
			print("Found node: \(searchResult1.value)")
		}
		  if let searchResult2 = tree.search("WKD Blue") {
			print(searchResult2.value)
		  } else {
			print("Couldn't find WKD Blue")
		}
	}

	// MARK: - Helpers
	private func makeBeverageTree() -> TreeNode<String> {
		let tree = TreeNode("Beverages")

		let hot = TreeNode("hot")
		let cold = TreeNode("cold")
		tree.add(hot)
		tree.add(cold)

		let tea = TreeNode("tea")
		let coffee = TreeNode("coffee")
		let cocoa = TreeNode("cocoa")
		hot.add(tea)
		hot.add(coffee)
		hot.add(cocoa)

		let blackTea = TreeNode("black")
		let greenTea = TreeNode("green")
		let chaiTea = TreeNode("chai")
		tea.add(blackTea)
		tea.add(greenTea)
		tea.add(chaiTea)

		let soda = TreeNode("soda")
		let milk = TreeNode("milk")
		cold.add(soda)
		cold.add(milk)

		let gingerAle = TreeNode("ginger ale")
		let bitterLemon = TreeNode("bitter lemon")
		soda.add(gingerAle)
		soda.add(bitterLemon)

		return tree
	}
}
