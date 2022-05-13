//
//  RecipeSummary.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 5/13/22.
//

import Foundation
class SummaryResult: Codable,CustomStringConvertible {
    var id:Int = 0
    var summary: String = ""
    var title: String = ""
    var description: String {
        return "\nResult - Title: \(summary)"
    }
}
