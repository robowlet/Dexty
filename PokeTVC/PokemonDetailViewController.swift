//
//  PokemonDetailViewController.swift
//  PokeTVC
//
//  Created by Rob Miguel on 4/11/18.
//  Copyright © 2018 Rob Miguel. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokemon: Pokemon?
    
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pokeImage.image = pokemon?.image
        pokeNameLabel.text = pokemon?.name
        //pokeNumber.text = pokemon?.number as! String
        
        // Do any additional setup after loading the view.
    }

  
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
