//
//  Result.swift
//  NetworkSDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 19/01/23.
//

import Foundation

// MARK: - Result

/** Generic enum used for either the success or failure of an operation */

public enum Result<T> {
  case success(T)
  case failure(Error)
}

// MARK: - Result Callback

public typealias ResultCallback<T> = (Result<T>) -> Void
