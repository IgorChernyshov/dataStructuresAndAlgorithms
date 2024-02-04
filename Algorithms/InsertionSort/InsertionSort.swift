//
//  InsertionSort.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
	guard array.count >= 2 else { return }

	for current in 1..<array.count {
		for shifting in (1...current).reversed() {
			if array[shifting] < array[shifting - 1] {
				array.swapAt(shifting, shifting - 1)
			} else {
				break
			}
		}
	}
}
