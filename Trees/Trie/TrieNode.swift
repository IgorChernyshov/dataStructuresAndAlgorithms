//
//  TrieNode.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 21.01.2024.
//

final class TrieNode<Key: Hashable> {

	var key: Key?

	weak var parent: TrieNode?
	var children = [Key: TrieNode]()

	var isTerminating = false

	init(key: Key?, parent: TrieNode?) {
		self.key = key
		self.parent = parent
	}
}
