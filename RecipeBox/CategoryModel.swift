//
//  CategoryModel.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 4/15/22.
//

import Foundation

class CategoryModel:NSObject, Codable{
    var categoryName: String?
    var categoryImage: String?
    var ingredients:[String]?
    var yourIngredients:[String]?
    init(categoryName: String?, categoryImage:String?, ingredients:[String]?){
        self.categoryName = categoryName
        self.categoryImage = categoryImage
        self.ingredients = ingredients
        self.yourIngredients = []
    }
}
