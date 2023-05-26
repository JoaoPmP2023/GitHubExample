//
//  ProblemEnum.swift
//  UISDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 26/05/23.
//

import Foundation

public enum ProblemEnum {
     
     case noData
     case error
     
     var imageName: String {
         switch self {
         case .noData:
             return "arrow.2.circlepath"
         case .error:
             return "exclamationMark"
         }
     }
     
     var message: String {
         switch self {
         case .noData:
             return "Nenhum dado foi encontrado tente novamente mais tarde!"
         case .error:
             return "Ocorreu um erro não esperado, por favor tente novamente mais tarde!"
         }
     }
 }
