//
//  DefinitionIMCCalculation.swift
//  IMC App
//
//  Created by Raul de Medeiros on 10/11/22.
//

import Foundation

struct Person{
    var height : Float
    var weight : Float
    var genre : Genre
    var imcResult : Float?
    var name : String
    
    init(height: Float, weight: Float, genre: Genre, name: String) {
        self.height = height
        self.weight = weight
        self.genre = genre
        self.name = name
    }
}

extension Person : CalcIMC{
    mutating func CalcIMC() -> Float {
        imcResult = weight / (2 * height)
        return imcResult!
    }

}
