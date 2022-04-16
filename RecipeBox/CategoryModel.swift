//
//  CategoryModel.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 4/15/22.
//

import Foundation

class CategoryModel{
    var categoryName: String?
    var categoryImage: String?
    init(categoryName: String?, categoryImage:String?){
        self.categoryName = categoryName
        self.categoryImage = categoryImage
    }
}
