//
//  PokemonDetailVC.swift
//  pokeDex
//
//  Created by Christopher Rathnam on 2/20/16.
//  Copyright © 2016 Christopher Rathnam. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var descriptionLbl: UILabel!
  
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        nameLbl.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            //called after download has completed
            self.updateUI()
        }
       
    }
    
    @IBAction func bioMovesToggle(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            nameLbl.text = pokemon.name.capitalizedString
            let img = UIImage(named: "\(pokemon.pokedexId)")
            mainImg.image = img
            currentEvoImg.image = img
            self.updateUI()
        } else {
            descriptionLbl.text = "Move List:"
            descriptionLbl.text = "\(pokemon.move)"
        }
        
    }
    
    func updateUI() {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextEvoltionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoltionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvoltionLvl != "" {
                str += " - LVL \(pokemon.nextEvoltionLvl)"
            }
        }
        
    }

    
}
