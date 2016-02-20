//
//  Pokemon.swift
//  pokeDex
//
//  Created by Christopher Rathnam on 2/20/16.
//  Copyright © 2016 Christopher Rathnam. All rights reserved.
//

import Foundation


class Pokemon {
    
    //Required variables to display Pokemon
    private var _name: String!
    private var _pokedexId: Int!
    
    
    var name: String {
        return _name
        
    }
    
    var pokedexId: Int {
        return _pokedexId
        
    }
    
    
    init(name: String, pokedexId: Int ) {
        
        self._name = name
        self._pokedexId = pokedexId
    }
        
    
    
}