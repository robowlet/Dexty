//
//  PokemonDetailViewController.swift
//  PokeTVC
//
//  Created by Rob Miguel on 4/11/18.
//  Copyright © 2018 Rob Miguel. All rights reserved.
//

import UIKit
import AVFoundation  

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeType: UILabel!
    @IBOutlet weak var pokeGen: UILabel!
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        configureView()
    }
    
    var audioPlayers = [AVAudioPlayer]()
    var detailPokemon: Pokemon?
    
    func configureView() {
        if let detailPokemon = detailPokemon {
            if let pokeNameLabel = pokeNameLabel, let pokeImage = pokeImage {
                pokeNameLabel.text = detailPokemon.name
                pokeImage.image = detailPokemon.image
                
                
                title = "# " + String(detailPokemon.number)
                
                // Detail - Gen Label
                //pokeGen.text = detailPokemon.generation
       
                // Detail - Type Label
                if let type2 = detailPokemon.type2 {
                    pokeType.text = "Type: \(detailPokemon.type), \(type2)"
                } else {
                    pokeType.text = "Type: \(detailPokemon.type)"
                }
                
                
                // Pokemon Sounds
                let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: "\(detailPokemon.number)", ofType: "wav")!)
                guard let audioPlayer = try? AVAudioPlayer(contentsOf: url as URL) else {
                    return
                }
                audioPlayers.append(audioPlayer)
                audioPlayer.play()
                
            }
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

}
