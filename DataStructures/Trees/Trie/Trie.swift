//
//  Trie.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 24.01.2024.
//

final class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {

	typealias Node = TrieNode<CollectionType.Element>

	private let root = Node(key: nil, parent: nil)

	init() {}

	func insert(_ collection: CollectionType) {
		var current = root

		for element in collection {
			if current.children[element] == nil {
				current.children[element] = TrieNode(key: element, parent: current)
			}
			current = current.children[element]!
		}

		current.isTerminating = true
	}

	func contains(_ collection: CollectionType) -> Bool {
		var current = root

		for element in collection {
			guard let child = current.children[element] else { return false }
			current = child
		}

		return current.isTerminating
	}

	func remove(_ collection: CollectionType) {
		var current = root

		for element in collection {
			guard let child = current.children[element] else { return }
			current = child
		}
		guard current.isTerminating else { return }

		current.isTerminating = false
		while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
			parent.children[current.key!] = nil
			current = parent
		}
	}
}

extension Trie where CollectionType: RangeReplaceableCollection {
	func collections(startingWith prefix: CollectionType) -> [CollectionType] {
		var current = root

		for element in prefix {
			guard let child = current.children[element] else {
				return []
			}
			current = child
		}

		return collections(startingWith: prefix, after: current)
	}

	private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
		var results: [CollectionType] = []

		if node.isTerminating {
			results.append(prefix)
		}
		for child in node.children.values {
			var prefix = prefix
			prefix.append(child.key!)
			results.append(contentsOf: collections(startingWith: prefix, after: child))
		}

		return results
	}
}
