//
//  QueueRingBuffer.swift
//  DataStructures
//
//  Created by Игорь Чернышов on 17.01.2024.
//

struct QueueRingBuffer<T>: Queue {

	private var ringBuffer: RingBuffer<T>

	init(count: Int) {
		self.ringBuffer = RingBuffer<T>(count: count)
	}

	var isEmpty: Bool { ringBuffer.isEmpty }

	var peek: T? { ringBuffer.first }

	mutating func enqueue(_ element: T) -> Bool {
		ringBuffer.write(element)
	}

	mutating func dequeue() -> T? {
		isEmpty ? nil : ringBuffer.read()
	}
}

extension QueueRingBuffer: CustomStringConvertible {
	var description: String {
		ringBuffer.description
	}
}
