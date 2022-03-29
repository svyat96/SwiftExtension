//
//  SafeThreadCombine.swift
//  
//
//  Created by Святослав Спорыхин on 3/26/22.
//

import Combine
import Foundation

@available(macOS 10.15, *)
struct SafeThreadCombine<Upstream: Publisher, S: Scheduler>: Publisher {
	func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, (currentPublisher: Upstream, isMainThread: Bool) == S.Input {
		let value = subscriber.receive((upstream, Thread.isMainThread))
	}
	
	typealias Output = (currentPublisher: Upstream, isMainThread: Bool)
	typealias Failure = Never
		
	let upstream: Upstream
	let safeThreadClosure: (Output) -> Publishers.ReceiveOn<Upstream, S>
	
	init(
		upstream: Upstream,
		safeThreadClosure: @escaping (Output) -> Publishers.ReceiveOn<Upstream, S>
	) {
		self.upstream = upstream
		self.safeThreadClosure = safeThreadClosure
	}
	
	final class EventSubscription<Target: Subscriber>: Subscription {
			var target: Target?
			func request(_ demand: Subscribers.Demand) {}

			func cancel() {
				target = nil
			}
		}
}

@available(macOS 10.15, *)
extension Publisher {
	func safeThread<S: Scheduler>(
		safeThreadClosure: @escaping ((Self, Bool)) -> Publishers.ReceiveOn<Self, S>
	) -> SafeThreadCombine<Self, S> {
		return SafeThreadCombine(
			upstream: self,
			safeThreadClosure: safeThreadClosure)
	}
}
