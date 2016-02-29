//
//  PokeCell.swift
//  pokeDex
//
//  Created by Christopher Rathnam on 2/20/16.
//  Copyright © 2016 Christopher Rathnam. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    //Store Pokemon Object
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = frame.size.width / 4
        
    }
    
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        
        //Sets Image with ID from CSV file
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
    }
    
    
}
