//
//  SafeThreadCombine.swift
//  
//
//  Created by Святослав Спорыхин on 3/26/22.
//

import Combine
import Foundation

@available(macOS 10.15, *)
struct AutoReceiveInMainQueue<Upstream: Publisher>: Publisher {
	func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input {
		if Thread.isMainThread {
			upstream
				.receive(on: RunLoop.current)
				.receive(subscriber: subscriber)
			return
		}
		upstream
			.receive(on: DispatchQueue.main)
			.receive(subscriber: subscriber)
	}
	
	typealias Output = Upstream.Output
	typealias Failure = Upstream.Failure
	
	let upstream: Upstream
	
	init(upstream: Upstream) {
		self.upstream = upstream
	}
}

//private final class SafeThreadCombineSubscription<S: Subscriber>: Subscription where S.Input == Publisher {
//
//}

@available(macOS 10.15, *)
extension Publisher {
	func autoReceiveInMainQueue() -> AutoReceiveInMainQueue<Self> {
		return AutoReceiveInMainQueue(upstream: self)
	}
}
