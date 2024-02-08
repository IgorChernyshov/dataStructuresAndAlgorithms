//
//  RadixSort.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 04.02.2024.
//

extension Array where Element == Int {

	mutating func radixSort() {
		let base = 10
		var didFinish = false
		var digits = 1

		while !didFinish {
			didFinish = true

			var buckets: [[Int]] = .init(repeating: [], count: base)
			forEach { number in
				let remainingPart = number / digits
				let digit = remainingPart % base
				buckets[digit].append(number)

				if remainingPart > 0 {
					didFinish = false
				}
			}
			digits *= base
			self = buckets.flatMap { $0 }
		}
	}
}
