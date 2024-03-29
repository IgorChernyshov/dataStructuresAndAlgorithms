//
//  MergeSort.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
	guard array.count > 1 else { return array }

	let middle = array.count / 2
	let leftArray = mergeSort(Array(array[..<middle]))
	let rightArray = mergeSort(Array(array[middle...]))

	return merge(leftArray, rightArray)
}

private func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
	var leftIndex = 0
	var rightIndex = 0
	var result = [Element]()

	while leftIndex < left.count && rightIndex < right.count {
		if left[leftIndex] < right[rightIndex] {
			result.append(left[leftIndex])
			leftIndex += 1
		} else if left[leftIndex] > right[rightIndex] {
			result.append(right[rightIndex])
			rightIndex += 1
		} else {
			result.append(left[leftIndex])
			leftIndex += 1
			result.append(right[rightIndex])
			rightIndex += 1
		}
	}

	if leftIndex < left.count {
		result.append(contentsOf: left[leftIndex...])
	}
	if rightIndex < right.count {
		result.append(contentsOf: right[rightIndex...])
	}

	return result
}
