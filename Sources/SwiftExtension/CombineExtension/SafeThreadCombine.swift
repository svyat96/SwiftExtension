//
//  SafeThreadCombine.swift
//  
//
//  Created by Святослав Спорыхин on 3/26/22.
//

import Combine
import Foundation

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public struct AutoReceiveInMainQueue<Upstream: Publisher>: Publisher {
	public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input {
		if Thread.isMainThread {
			upstream
				.receive(on: RunLoop.current)
				.receive(subscriber: subscriber)
			return
		}
		upstream
			.receive(on: RunLoop.main)
			.receive(subscriber: subscriber)
	}
	
	public typealias Output = Upstream.Output
	public typealias Failure = Upstream.Failure
	
	let upstream: Upstream
	
	init(upstream: Upstream) {
		self.upstream = upstream
	}
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Publisher {
	public func autoReceiveInMainQueue() -> AutoReceiveInMainQueue<Self> {
		return AutoReceiveInMainQueue(upstream: self)
	}
}
