//
//  BubbleSort.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

func bubbleSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
	guard collection.count >= 2 else { return }

	for end in collection.indices.reversed() {
		var didSwap = false
		var current = collection.startIndex

		while current < end {
			let next = collection.index(after: current)
			if collection[current] > collection[next] {
				collection.swapAt(current, next)
				didSwap = true
			}
			current = next
		}

		if !didSwap { return }
	}
}
