//  Copyright © 2022 Learnfield GmbH. All rights reserved.

import Foundation

/// Collection of DI utils
public class InjectUtils {

    /// Helper function to load achieve similar readability as koin on Android
    public static func loadModules(_ resolver: DependencyResolver.ModuleDeclaration) {
        resolver(DependencyResolver.shared)
    }
    
    // Create a method to expose the clear method of Dependency Resolver
    public static func clear() {
        DependencyResolver.shared.clear()
    }
}
