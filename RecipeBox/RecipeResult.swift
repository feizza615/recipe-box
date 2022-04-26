//
//  RecipeResult.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 4/21/22.
//

import Foundation
//

class SearchResult: Codable,CustomStringConvertible {
  var id:Int = 0
  var title: String = ""
  var image: String = ""
  var imageType: String? = ""
  var usedIngredientCount: Int? = 0
  var missedIngredientCount: Int? = 0
  var missedIngredients:[IngredientDetail]
  var usedIngredients:[IngredientDetail]
  var unusedIngredients:[IngredientDetail]

  var likes: Int? = 0
    
var description: String {
    return "\nResult - Title: \(title)"
}

}

struct IngredientDetail:Codable{
    var id:Int? = 0
    var amount:Float? = 0
    var unit:String? = ""
    var unitLong:String? = ""
    var unitShort:String? = ""
    var aisle:String? = ""
    var name:String? = ""
    var original:String? = ""
    var orginalName:String? = ""
    var meta:[String?]
    var image: String? = ""
}

