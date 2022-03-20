import Foundation

extension String {
	public static let empty = ""
	public static let space = " "
	
	public func add(_ value: CustomStringConvertible) -> String {
		return self + value.description
	}
	
	public func add(_ value: CustomDescription) -> String {
		return self + value.customDescription
	}
}

public protocol CustomDescription {
	var customDescription: String { get }
}
