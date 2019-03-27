//
//  ReturnSignature.swift
//  CuckooGeneratorFramework
//
//  Created by Matyáš Kříž on 25/03/2019.
//

import Foundation

public struct ReturnSignature {
    var throwString: String?
    var returnType: WrappableType
    var whereConstraints: [String]

    var isThrowing: Bool {
        guard let throwString = throwString else { return false }
        return throwString.trimmed.hasPrefix("throws")
    }

    var isRethrowing: Bool {
        guard let throwString = throwString else { return false }
        return throwString.trimmed.hasPrefix("rethrows")
    }
}

extension ReturnSignature: CustomStringConvertible {
    public var description: String {
        let trimmedReturnType = returnType.sugarizedExplicitOnly.trimmed
        let returnString = trimmedReturnType.isEmpty || trimmedReturnType == "Void" ? nil : "-> \(returnType)"
        let whereString = whereConstraints.isEmpty ? nil : "where \(whereConstraints.joined(separator: ", "))"
        return [throwString, returnString, whereString].compactMap { $0 }.joined(separator: " ")
    }
}
