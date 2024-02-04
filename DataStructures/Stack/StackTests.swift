//
//  StackTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 30.12.2023.
//

struct StackTests {

	func runTests() {
		testPrintStack()
		testCreateStackFromArray()
		testCreateStackFromArrayLiteral()
	}

	private func testPrintStack() {
		var stack = Stack<String>()
		stack.push("Lol")
		stack.push("Kek")
		stack.push("Cheburek")
		print(stack)
	}

	private func testCreateStackFromArray() {
		let stack = Stack([1, 2, 3])
		print(stack)
	}

	private func testCreateStackFromArrayLiteral() {
		let stack: Stack = [1.0, 2.0, 3.0]
		print(stack)
	}
}
