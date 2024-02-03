//
//  TrieTests.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 24.01.2024.
//

struct TrieTests {

	func runTests() {
		testInsertSearch()
		testRemove()
	}

	// MARK: - Tests
	private func testInsertSearch() {
		print("Test insert -> search\n-----")
		let trie = Trie<String>()
		trie.insert("foobar")
		print("Contains foobar: ", trie.contains("foobar"))
		print("Contains foo: ", trie.contains("foo"))
	}

	private func testRemove() {
		print("Test remove\n-----")
		let trie = Trie<String>()
		trie.insert("cut")
		trie.insert("cute")
		print("\n*** Before removing ***")
		assert(trie.contains("cut"))
		print("\"cut\" is in the trie")
		assert(trie.contains("cute"))
		print("\"cute\" is in the trie")
		print("\n*** After removing cut ***")
		trie.remove("cut")
		assert(!trie.contains("cut"))
		print("\"cut\" is not in the trie")
		assert(trie.contains("cute"))
		print("\"cute\" is still in the trie")
	}
}
