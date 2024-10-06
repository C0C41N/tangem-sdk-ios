//
//  Eval.swift
//  TangemSdk
//
//  Created by Ali M. on 06/10/2024.
//

public class Eval<T, U> {
    public let success: Bool
    public let value: T?
    public let error: U?
    
    public init(success: Bool, value: T? = nil, error: U? = nil) {
        self.success = success
        self.value = value
        self.error = error
    }
    
    public static func success(_ value: T) -> Eval {
        return Eval(success: true, value: value)
    }
    
    public static func failure(_ error: U) -> Eval {
        return Eval(success: false, error: error)
    }
}
