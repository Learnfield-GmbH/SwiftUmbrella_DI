//  Copyright © 2022 Learnfield GmbH. All rights reserved.

import Foundation
import SwiftUI

@propertyWrapper
public struct InjectStateObject<TYPE>: DynamicProperty where TYPE: ObservableObject {
    public var wrappedValue: TYPE {
        get {
            DependencyResolver.shared.resolve()
        }
    }

    @StateObject
    private var value: TYPE
}
