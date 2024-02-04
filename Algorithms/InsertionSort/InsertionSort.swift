//
//  InsertionSort.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

func insertionSort<T>(_ collection: inout T) where T: BidirectionalCollection & MutableCollection, T.Element: Comparable {
	guard collection.count >= 2 else { return }

	for current in collection.indices {
		var shifting = current
		while shifting > collection.startIndex {
			let previous = collection.index(before: shifting)
			if collection[shifting] < collection[previous] {
				collection.swapAt(shifting, previous)
			} else {
				break
			}
			shifting = previous
		}
	}
}
