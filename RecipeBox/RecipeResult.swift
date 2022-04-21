//
//  RecipeResult.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 4/21/22.
//

import Foundation
class ResultArray: Codable {
    var resultCount = 0
    var results = [Recipe]()
}

class Recipe: Codable {
  var artistName: String? = ""
  var trackName: String? = ""
  
  var name: String {
    return trackName ?? ""
  }
}
