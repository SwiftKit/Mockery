//
//  MultiNestedInPrivateNestedClass.swift
//  Cuckoo
//
//  Created by thompsty on 9/18/20.
//

import Foundation

class MultiNestedClass {
    private class PrivateNestedClass {
        class ThisClassShouldNotBeMocked2 {
            var property: Int?
        }
    }
}
