# Swift Extensions and Utilities

This project provides a comprehensive set of extensions and utilities for standard Swift types, enhancing their functionality, readability, and usability. The goal is to simplify common operations, ensure safety and stability, and improve code maintainability.

# Features

- **Enhanced Standard Types**:
  - Extensions for `Array`, `Dictionary`, `CGFloat`, `String`, `Optional`, `Int`, `Float`, `Double`, and more.
  - Added utility methods for safe element access, arithmetic operations, and string manipulations.

- **Protocols for Universal Operations**:
  - `NonOptionalProtocol`: Ensures types have a default non-optional value.
  - `ConcatenationProtocol`: Defines a method for concatenating values to an array.
  - `GetIfProtocol`: Provides methods for conditional value retrieval.

- **Convenient Conditional Operations**:
  - `TernaryEnum` and `Ternary`: Abstract ternary logic for readable conditional operations.

# Extensions Overview

## Array
- Safe access to elements.
- Methods to remove elements by index.
- Adding elements or arrays to the head or tail.

## Dictionary
- Methods to append values to arrays within dictionaries.
- Safe value setting with defaults.
- Protocol conformance to `DefaultInit`.

## CGFloat
- Utility methods for creating `CGSize` and `CGPoint`.
- Screen dimensions.

## String
- Methods for manipulating string content, such as removing prefixes/suffixes and capitalizing the first letter.
- Conversion to numeric types.

## Optional
- Methods to provide default values for optionals.

## Int
- Methods for creating `IndexPath` from integers.

## Protocols
- `NonOptionalProtocol`: Ensures default values for types.
- `ConcatenationProtocol`: Provides concatenation methods.
- `GetIfProtocol`: Defines conditional retrieval methods.

# Installation

Add the files to your Swift project or integrate using your preferred dependency management system.

# Usage

Import the extensions in your Swift files and start using the enhanced methods. Refer to the method documentation for detailed usage instructions.

Example:

```swift
import Foundation

let array: [Int] = [1, 2, 3]
let safeElement = array[safe: 10] // nil

let optionalString: String? = nil
let nonOptionalString = optionalString.nonOptional() // ""

let screenWidth = CGFloat.screenWidth
let screenHeight = CGFloat.screenHeight
```

# Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes. Ensure that your code follows the project's coding standards and includes appropriate documentation.

# License

This project is licensed under the MIT License. See the LICENSE file for details.

# Contact

For any questions or inquiries, please contact:

Svyatoslav Sporykhin
Email: [svyat1996@gmail.com](mailto:svyat1996@gmail.com)
