//
//  RingBuffer.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 17.01.2024.
//

public struct RingBuffer<T> {

	private var array: [T?]
	private var readIndex = 0
	private var writeIndex = 0

	init(count: Int) {
		array = [T?](repeating: nil, count: count)
	}

	@discardableResult
	mutating func write(_ element: T) -> Bool {
		guard !isFull else { return false }
		defer { writeIndex += 1 }
		array[wrapped: writeIndex] = element
		return true
	}

	mutating func read() -> T? {
		guard !isEmpty else { return nil }
		defer {
			array[wrapped: readIndex] = nil
			readIndex += 1
		}
		return array[wrapped: readIndex]
	}

	var availableSpaceForReading: Int {
		writeIndex - readIndex
	}

	var isEmpty: Bool {
		availableSpaceForReading == 0
	}

	var availableSpaceForWriting: Int {
		array.count - availableSpaceForReading
	}

	var isFull: Bool {
		availableSpaceForWriting == 0
	}

	var first: T? {
		array[wrapped: readIndex]
	}
}

extension RingBuffer: Sequence {
	public func makeIterator() -> AnyIterator<T> {
		var index = readIndex
		return AnyIterator {
			guard index < self.writeIndex else { return nil }
			defer {
				index += 1
			}
			return self.array[wrapped: index]
		}
	}
}

private extension Array {
	subscript(wrapped index: Int) -> Element {
		get {
			self[index % count]
		}
		set {
			self[index % count] = newValue
		}
	}
}
