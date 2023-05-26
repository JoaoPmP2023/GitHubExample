//
//  NetworkTaskManager.swift
//  NetworkSDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 19/01/23.
//

import Foundation

open class NetworkTaskManager: NetworkTaskManagerProtocol {
  
  private var tasks: [String: URLSessionTask] = [:]
    
    public init() {}
  
  var currentTasksCount = 0
  
    public func task(forRequest request: URLRequest) -> URLSessionTask? {
    guard let identifier = request.url?.absoluteString else { return nil }
    return tasks[identifier]
  }
  
    public func add(_ task: URLSessionTask, forRequest request: URLRequest) {
    guard let identifier = request.url?.absoluteString else { return }
    tasks[identifier] = task
    currentTasksCount += 1
  }
  
    public func removeTask(forRequest request: URLRequest) {
    guard let identifier = request.url?.absoluteString else { return }
    tasks[identifier] = nil
    currentTasksCount -= 1
  }
  
}
