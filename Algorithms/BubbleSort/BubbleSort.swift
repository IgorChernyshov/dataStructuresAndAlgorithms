//
//  BubbleSort.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
	guard array.count >= 2 else { return }

	for end in (1..<array.count).reversed() {
		var didSwap = false

		for current in 0..<end {
			if array[current] > array[current + 1] {
				array.swapAt(current, current + 1)
				didSwap = true
			}
		}

		if !didSwap {
			return
		}
	}
}
