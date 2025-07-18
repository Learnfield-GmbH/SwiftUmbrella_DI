//  Copyright © 2022 Learnfield GmbH. All rights reserved.

import Foundation

/// This is the main class for dependency registration and resolving
public class DependencyResolver {

    /// Internal callback for factory creation
    private typealias FactoryCallback = () -> Any

    /// Public callback to declare all modules
    public typealias ModuleDeclaration = (DependencyResolver) -> Void

    /// Public accessor to god object
    static let shared = DependencyResolver()

    /// The collection of single instances
    private var singles   = [String: Any]()
    private var singleFactories = [String: FactoryCallback]()

    /// The collection of multi instances
    private var factories = [String: FactoryCallback]()

    /// Register a lazy singleton dependency. It will register a factory for the
    public func single<TYPE>(_ resolver: @escaping () -> TYPE) {
        singleFactories[String(describing: TYPE.self)] = resolver
    }

    /// Register a factory function for a dependency. It will always create a new
    /// instance with the given function if registered with this method
    public func factory<TYPE>(_ resolver: @escaping () -> TYPE) {
        factories[String(describing: TYPE.self)] = resolver
    }

    /// Resolve a dependency for the given type. It looks up singletons first, then
    /// checks for factory methods to resolve the dependency.
    /// A fatal warning is triggered if the dependency cannot be resolved
    public func resolve<TYPE>() -> TYPE {
        let key = String(describing: TYPE.self)

        if let single = singles[key] as? TYPE {
            return single
        }

        if let singleFactoryResult = singleFactories[key]?() as? TYPE {
            singles[key] = singleFactoryResult
            return singleFactoryResult
        }

        if let factoryResult = factories[key]?() as? TYPE {
            return factoryResult
        }

        fatalError("Dependency '\(key)' could not be resolved")
    }
}
