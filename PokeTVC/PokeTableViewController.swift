//
//  PokeTableViewController.swift
//  PokeTVC
//
//  Created by Rob Miguel on 4/10/18.
//  Copyright © 2018 Rob Miguel. All rights reserved.
//

import UIKit
import AVFoundation

class PokeTableViewController: UITableViewController {
    
    var detailViewController: PokemonDetailViewController? = nil
    var pokemons = [Pokemon]()
    var filteredPokemons = [Pokemon]()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    // MARK: View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Customize
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        // Setup the Search Controller
        
        navigationItem.hidesSearchBarWhenScrolling = false

        navigationItem.searchController = searchController
        

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
      
        
        searchController.searchBar.setImage(UIImage(named: "pokeball-1"), for: UISearchBarIcon.search, state: .normal)

        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search Pokémon", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])

        
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["All", "Gen 1", "Gen 2", "Gen 3", "Gen 4", "Gen 5", "Gen 6", "Gen 7"]
        searchController.searchBar.delegate = self
 

        
        
        pokemons = [
            
            // MARK: Gen 1 ////////////////////////////////////////////////////////////////////////////////////////////////////////
            
            Pokemon(name: "Bulbasaur", number: 1, image: UIImage(named: "1"), generation: "Gen 1", type: .Grass, type2: .Poison),
            Pokemon(name: "Ivysaur", number: 2, image: UIImage(named: "2"), generation: "Gen 1", type: .Grass, type2: .Poison),
            Pokemon(name: "Venusaur", number: 3, image: UIImage(named: "3"), generation: "Gen 1", type: .Grass, type2: .Poison),
            Pokemon(name: "Charmander", number: 4, image: UIImage(named: "4"), generation: "Gen 1", type: .Fire, type2: nil),
            Pokemon(name: "Charmeleon", number: 5, image: UIImage(named: "5"), generation: "Gen 1", type: .Fire, type2: nil),
            Pokemon(name: "Charizard", number: 6, image: UIImage(named: "6"), generation: "Gen 1", type: .Fire, type2: .Flying),
            Pokemon(name: "Squirtle", number: 7, image: UIImage(named: "7"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Wartortle", number: 8, image: UIImage(named: "8"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Blastoise", number: 9, image: UIImage(named: "9"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Caterpie", number: 10, image: UIImage(named: "10"), generation: "Gen 1", type: .Bug, type2: nil),
            Pokemon(name: "Metapod", number: 11, image: UIImage(named: "11"), generation: "Gen 1", type: .Bug, type2: nil),
            Pokemon(name: "Butterfree", number: 12, image: UIImage(named: "12"), generation: "Gen 1", type: .Bug, type2: .Flying),
            Pokemon(name: "Weedle", number: 13, image: UIImage(named: "13"), generation: "Gen 1", type: .Bug, type2: .Poison),
            Pokemon(name: "Kakuna", number: 14, image: UIImage(named: "14"), generation: "Gen 1", type: .Bug, type2: .Poison),
            Pokemon(name: "Beedrill", number: 15, image: UIImage(named: "15"), generation: "Gen 1", type: .Bug, type2: .Poison),
            Pokemon(name: "Pidgey", number: 16, image: UIImage(named: "16"), generation: "Gen 1", type: .Normal, type2: .Flying),
            Pokemon(name: "Pidgeotto", number: 17, image: UIImage(named: "17"), generation: "Gen 1", type: .Normal, type2: .Flying),
            Pokemon(name: "Pidgeot", number: 18, image: UIImage(named: "18"), generation: "Gen 1", type: .Normal, type2: .Flying),
            Pokemon(name: "Rattata", number: 19, image: UIImage(named: "19"), generation: "Gen 1", type: .Normal, type2: nil),
//            Pokemon(name: "Rattata (Alolan)", number: 19, image: UIImage(named: "019_1"), generation: "Gen 1", type: .Dark, type2: .Normal),
            Pokemon(name: "Raticate", number: 20, image: UIImage(named: "20"), generation: "Gen 1", type: .Normal, type2: nil),
//            Pokemon(name: "Raticate (Alolan)", number: 20, image: UIImage(named: "020_1"), generation: "Gen 1", type: .Dark, type2: .Normal),
            Pokemon(name: "Spearow", number: 21, image: UIImage(named: "21"), generation: "Gen 1", type: .Normal, type2: .Flying),
            Pokemon(name: "Fearow", number: 22, image: UIImage(named: "22"), generation: "Gen 1", type: .Normal, type2: .Flying),
            Pokemon(name: "Ekans", number: 23, image: UIImage(named: "23"), generation: "Gen 1", type: .Poison, type2: nil),
            Pokemon(name: "Arbok", number: 24, image: UIImage(named: "24"), generation: "Gen 1", type: .Poison, type2: nil),
            Pokemon(name: "Pikachu", number: 25, image: UIImage(named: "25"), generation: "Gen 1", type: .Electric, type2: nil),
            Pokemon(name: "Raichu", number: 26, image: UIImage(named: "26"), generation: "Gen 1", type: .Electric, type2: nil),
//            Pokemon(name: "Raichu (Alolan)", number: 26, image: UIImage(named: "026_1"), generation: "Gen 1", type: .Electric, type2: .Psychic),
            Pokemon(name: "Sandshrew", number: 27, image: UIImage(named: "27"), generation: "Gen 1", type: .Ground, type2: nil),
//            Pokemon(name: "Sandshrew (Alolan)", number: 27, image: UIImage(named: "027_1"), generation: "Gen 1", type: .Ice, type2: .Steel),
            Pokemon(name: "Sandslash", number: 28, image: UIImage(named: "28"), generation: "Gen 1", type: .Ground, type2: nil),
//            Pokemon(name: "Sandslash (Alolan)", number: 28, image: UIImage(named: "028_1"), generation: "Gen 1", type: .Ice, type2: .Steel),
            Pokemon(name: "Nidoran♀", number: 29, image: UIImage(named: "29"), generation: "Gen 1", type: .Poison, type2: nil),
            Pokemon(name: "Nidorina", number: 30, image: UIImage(named: "30"), generation: "Gen 1", type: .Poison, type2: nil),
            Pokemon(name: "Nidoqueen", number: 31, image: UIImage(named: "31"), generation: "Gen 1", type: .Poison, type2: .Ground),
            Pokemon(name: "Nidoran♂", number: 32, image: UIImage(named: "32"), generation: "Gen 1", type: .Poison, type2: nil),
            Pokemon(name: "Nidorino", number: 33, image: UIImage(named: "33"), generation: "Gen 1", type: .Poison, type2: nil),
            Pokemon(name: "Nidoking", number: 34, image: UIImage(named: "34"), generation: "Gen 1", type: .Poison, type2: .Ground),
            Pokemon(name: "Clefairy", number: 35, image: UIImage(named: "35"), generation: "Gen 1", type: .Fairy, type2: nil),
            Pokemon(name: "Clefable", number: 36, image: UIImage(named: "36"), generation: "Gen 1", type: .Fairy, type2: nil),
            Pokemon(name: "Vulpix", number: 37, image: UIImage(named: "37"), generation: "Gen 1", type: .Fire, type2: nil),
//            Pokemon(name: "Vulpix (Alolan)", number: 37, image: UIImage(named: "037_1"), generation: "Gen 1", type: .Ice, type2: nil),
            Pokemon(name: "Ninetales", number: 38, image: UIImage(named: "38"), generation: "Gen 1", type: .Fire, type2: nil),
//            Pokemon(name: "Ninetales (Alolan)", number: 38, image: UIImage(named: "038_1"), generation: "Gen 1", type: .Ice, type2: .Fairy),
            Pokemon(name: "Jigglypuff", number: 39, image: UIImage(named: "39"), generation: "Gen 1", type: .Normal, type2: .Fairy),
            Pokemon(name: "Wigglytuff", number: 40, image: UIImage(named: "40"), generation: "Gen 1", type: .Normal, type2: .Fairy),
            Pokemon(name: "Zubat", number: 41, image: UIImage(named: "41"), generation: "Gen 1", type: .Flying, type2: .Poison),
            Pokemon(name: "Golbat", number: 42, image: UIImage(named: "42"), generation: "Gen 1", type: .Flying, type2: .Poison),
            Pokemon(name: "Oddish", number: 43, image: UIImage(named: "43"), generation: "Gen 1", type: .Grass, type2: .Poison),
            Pokemon(name: "Gloom", number: 44, image: UIImage(named: "44"), generation: "Gen 1", type: .Grass, type2: .Poison),
            Pokemon(name: "Vileploom", number: 45, image: UIImage(named: "45"), generation: "Gen 1", type: .Grass, type2: .Poison),
            Pokemon(name: "Paras", number: 46, image: UIImage(named: "46"), generation: "Gen 1", type: .Bug, type2: .Grass),
            Pokemon(name: "Parasect", number: 47, image: UIImage(named: "47"), generation: "Gen 1", type: .Bug, type2: .Grass),
            Pokemon(name: "Venonat", number: 48, image: UIImage(named: "48"), generation: "Gen 1", type: .Bug, type2: .Poison),
            Pokemon(name: "Venomoth", number: 49, image: UIImage(named: "49"), generation: "Gen 1", type: .Bug, type2: .Poison),
            Pokemon(name: "Diglett", number: 50, image: UIImage(named: "50"), generation: "Gen 1", type: .Ground, type2: nil),
//            Pokemon(name: "Diglett (Alolan)", number: 50, image: UIImage(named: "050_1"), generation: "Gen 1", type: .Ground, type2: .Steel),
            Pokemon(name: "Dugtrio", number: 51, image: UIImage(named: "51"), generation: "Gen 1", type: .Ground, type2: nil),
//            Pokemon(name: "Dugtrio (Alolan)", number: 51, image: UIImage(named: "051_1"), generation: "Gen 1", type: .Ground, type2: .Steel),
            Pokemon(name: "Meowth", number: 52, image: UIImage(named: "52"), generation: "Gen 1", type: .Normal, type2: nil),
//            Pokemon(name: "Meowth (Alolan)", number: 52, image: UIImage(named: "052_1"), generation: "Gen 1", type: .Dark, type2: nil),
            Pokemon(name: "Persian", number: 53, image: UIImage(named: "53"), generation: "Gen 1", type: .Normal, type2: nil),
//            Pokemon(name: "Persian (Alolan)", number: 53, image: UIImage(named: "053_1"), generation: "Gen 1", type: .Dark, type2: nil),
            Pokemon(name: "Psyduck", number: 54, image: UIImage(named: "54"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Golduck", number: 55, image: UIImage(named: "55"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Mankey", number: 56, image: UIImage(named: "56"), generation: "Gen 1", type: .Fighting, type2: nil),
            Pokemon(name: "Primape", number: 57, image: UIImage(named: "57"), generation: "Gen 1", type: .Fighting, type2: nil),
            Pokemon(name: "Growlithe", number: 58, image: UIImage(named: "58"), generation: "Gen 1", type: .Fire, type2: nil),
            Pokemon(name: "Arcanine", number: 59, image: UIImage(named: "59"), generation: "Gen 1", type: .Fire, type2: nil),
            Pokemon(name: "Poliwag", number: 60, image: UIImage(named: "60"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Poliwhirl", number: 61, image: UIImage(named: "61"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Poliwrath", number: 62, image: UIImage(named: "62"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Abra", number: 63, image: UIImage(named: "63"), generation: "Gen 1", type: .Psychic, type2: nil),
            Pokemon(name: "Kadabra", number: 64, image: UIImage(named: "64"), generation: "Gen 1", type: .Psychic, type2: nil),
            Pokemon(name: "Alakazam", number: 65, image: UIImage(named: "65"), generation: "Gen 1", type: .Psychic, type2: nil),
            Pokemon(name: "Machop", number: 66, image: UIImage(named: "66"), generation: "Gen 1", type: .Fighting, type2: nil),
            Pokemon(name: "Machoke", number: 67, image: UIImage(named: "67"), generation: "Gen 1", type: .Fighting, type2: nil),
            Pokemon(name: "Machamp", number: 68, image: UIImage(named: "68"), generation: "Gen 1", type: .Fighting, type2: nil),
            Pokemon(name: "Bellsprout", number: 69, image: UIImage(named: "69"), generation: "Gen 1", type: .Grass, type2: .Poison),
            Pokemon(name: "Weepinbell", number: 70, image: UIImage(named: "70"), generation: "Gen 1", type: .Grass, type2: .Poison),
            Pokemon(name: "Victeebell", number: 71, image: UIImage(named: "71"), generation: "Gen 1", type: .Grass, type2: .Poison),
            Pokemon(name: "Tentacool", number: 72, image: UIImage(named: "72"), generation: "Gen 1", type: .Water, type2: .Poison),
            Pokemon(name: "Tentacruel", number: 73, image: UIImage(named: "73"), generation: "Gen 1", type: .Water, type2: .Poison),
            Pokemon(name: "Geodude", number: 74, image: UIImage(named: "74"), generation: "Gen 1", type: .Rock, type2: .Ground),
//            Pokemon(name: "Geodude (Alolan)", number: 74, image: UIImage(named: "074_1"), generation: "Gen 1", type: .Rock, type2: .Electric),
            Pokemon(name: "Graveler", number: 75, image: UIImage(named: "75"), generation: "Gen 1", type: .Rock, type2: .Ground),
//            Pokemon(name: "Graveler (Alolan)", number: 75, image: UIImage(named: "075_1"), generation: "Gen 1", type: .Rock, type2: .Electric),
            Pokemon(name: "Golem", number: 76, image: UIImage(named: "76"), generation: "Gen 1", type: .Rock, type2: .Ground),
//            Pokemon(name: "Golem (Alolan)", number: 76, image: UIImage(named: "076_1"), generation: "Gen 1", type: .Rock, type2: .Ground),
            Pokemon(name: "Ponyta", number: 77, image: UIImage(named: "77"), generation: "Gen 1", type: .Fire, type2: nil),
            Pokemon(name: "Rapidash", number: 78, image: UIImage(named: "78"), generation: "Gen 1", type: .Fire, type2: nil),
            Pokemon(name: "Slowpoke", number: 79, image: UIImage(named: "79"), generation: "Gen 1", type: .Water, type2: .Psychic),
            Pokemon(name: "Slowbro", number: 80, image: UIImage(named: "80"), generation: "Gen 1", type: .Water, type2: .Psychic),
            Pokemon(name: "Magnemite", number: 81, image: UIImage(named: "81"), generation: "Gen 1", type: .Electric, type2: .Steel),
            Pokemon(name: "Megneton", number: 82, image: UIImage(named: "82"), generation: "Gen 1", type: .Electric, type2: .Steel),
            Pokemon(name: "Farfetch'd", number: 83, image: UIImage(named: "83"), generation: "Gen 1", type: .Normal, type2: .Flying),
            Pokemon(name: "Doduo", number: 84, image: UIImage(named: "84"), generation: "Gen 1", type: .Normal, type2: .Flying),
            Pokemon(name: "Dodrio", number: 85, image: UIImage(named: "85"), generation: "Gen 1", type: .Normal, type2: .Flying),
            Pokemon(name: "Seel", number: 86, image: UIImage(named: "86"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Dewgong", number: 87, image: UIImage(named: "87"), generation: "Gen 1", type: .Water, type2: .Ice),
            Pokemon(name: "Grimer", number: 88, image: UIImage(named: "88"), generation: "Gen 1", type: .Poison, type2: nil),
//            Pokemon(name: "Grimer (Alolan)", number: 88, image: UIImage(named: "088_1"), generation: "Gen 1", type: .Poison, type2: .Dark),
            Pokemon(name: "Muk", number: 89, image: UIImage(named: "89"), generation: "Gen 1", type: .Poison, type2: nil),
//            Pokemon(name: "Muk (Alolan)", number: 89, image: UIImage(named: "089_1"), generation: "Gen 1", type: .Poison, type2: .Dark),
            Pokemon(name: "Shellder", number: 90, image: UIImage(named: "90"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Cloyster", number: 91, image: UIImage(named: "91"), generation: "Gen 1", type: .Water, type2: .Ice),
            Pokemon(name: "Gastly", number: 92, image: UIImage(named: "92"), generation: "Gen 1", type: .Ghost, type2: .Poison),
            Pokemon(name: "Haunter", number: 93, image: UIImage(named: "93"), generation: "Gen 1", type: .Ghost, type2: .Poison),
            Pokemon(name: "Gengar", number: 94, image: UIImage(named: "94"), generation: "Gen 1", type: .Ghost, type2: .Poison),
            Pokemon(name: "Onix", number: 95, image: UIImage(named: "95"), generation: "Gen 1", type: .Rock, type2: .Ground),
            Pokemon(name: "Drowzee", number: 96, image: UIImage(named: "96"), generation: "Gen 1", type: .Psychic, type2: nil),
            Pokemon(name: "Hypno", number: 97, image: UIImage(named: "97"), generation: "Gen 1", type: .Psychic, type2: nil),
            Pokemon(name: "Krabby", number: 98, image: UIImage(named: "98"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Kingler", number: 99, image: UIImage(named: "99"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Voltorb", number: 100, image: UIImage(named: "100"), generation: "Gen 1", type: .Electric, type2: nil),
            Pokemon(name: "Electrode", number: 101, image: UIImage(named: "101"), generation: "Gen 1", type: .Electric, type2: nil),
            Pokemon(name: "Exeggcute", number: 102, image: UIImage(named: "102"), generation: "Gen 1", type: .Grass, type2: .Psychic),
            Pokemon(name: "Exeggutor", number: 103, image: UIImage(named: "103"), generation: "Gen 1", type: .Grass, type2: .Psychic),
//            Pokemon(name: "Exeggutor (Alolan)", number: 103, image: UIImage(named: "103_1"), generation: "Gen 1", type: .Grass, type2: .Dragon),
            Pokemon(name: "Cubone", number: 104, image: UIImage(named: "104"), generation: "Gen 1", type: .Ground, type2: nil),
            Pokemon(name: "Marowak", number: 105, image: UIImage(named: "105"), generation: "Gen 1", type: .Ground, type2: nil),
//            Pokemon(name: "Marowak (Alolan)", number: 105, image: UIImage(named: "105_1"), generation: "Gen 1", type: .Fire, type2: .Ghost),
            Pokemon(name: "Hitmonlee", number: 106, image: UIImage(named: "106"), generation: "Gen 1", type: .Fighting, type2: nil),
            Pokemon(name: "Hitmonchan", number: 107, image: UIImage(named: "107"), generation: "Gen 1", type: .Fighting, type2: nil),
            Pokemon(name: "Lickitung", number: 108, image: UIImage(named: "108"), generation: "Gen 1", type: .Normal, type2: nil),
            Pokemon(name: "Koffing", number: 109, image: UIImage(named: "109"), generation: "Gen 1", type: .Poison, type2: nil),
            Pokemon(name: "Weezing", number: 110, image: UIImage(named: "110"), generation: "Gen 1", type: .Poison, type2: nil),
            Pokemon(name: "Rhyhorn", number: 111, image: UIImage(named: "111"), generation: "Gen 1", type: .Ground, type2: .Rock),
            Pokemon(name: "Rhydon", number: 112, image: UIImage(named: "112"), generation: "Gen 1", type: .Ground, type2: .Rock),
            Pokemon(name: "Chansey", number: 113, image: UIImage(named: "113"), generation: "Gen 1", type: .Normal, type2: nil),
            Pokemon(name: "Tangela", number: 114, image: UIImage(named: "114"), generation: "Gen 1", type: .Grass, type2: nil),
            Pokemon(name: "Kangaskhan", number: 115, image: UIImage(named: "115"), generation: "Gen 1", type: .Normal, type2: nil),
            Pokemon(name: "Horsea", number: 116, image: UIImage(named: "116"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Seadra", number: 117, image: UIImage(named: "117"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Goldeen", number: 118, image: UIImage(named: "118"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Seaking", number: 119, image: UIImage(named: "119"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Staryu", number: 120, image: UIImage(named: "120"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Starmie", number: 121, image: UIImage(named: "121"), generation: "Gen 1", type: .Water, type2: .Psychic),
            Pokemon(name: "Mr. Mime", number: 122, image: UIImage(named: "122"), generation: "Gen 1", type: .Psychic, type2: .Fairy),
            Pokemon(name: "Scyther", number: 123, image: UIImage(named: "123"), generation: "Gen 1", type: .Bug, type2: .Flying),
            Pokemon(name: "Jynx", number: 124, image: UIImage(named: "124"), generation: "Gen 1", type: .Psychic, type2: .Fairy),
            Pokemon(name: "Electabuzz", number: 125, image: UIImage(named: "125"), generation: "Gen 1", type: .Electric, type2: nil),
            Pokemon(name: "Magmar", number: 126, image: UIImage(named: "126"), generation: "Gen 1", type: .Fire, type2: nil),
            Pokemon(name: "Pinsir", number: 127, image: UIImage(named: "127"), generation: "Gen 1", type: .Bug, type2: nil),
            Pokemon(name: "Tauros", number: 128, image: UIImage(named: "128"), generation: "Gen 1", type: .Normal, type2: nil),
            Pokemon(name: "Magikarp", number: 129, image: UIImage(named: "129"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Gyarados", number: 130, image: UIImage(named: "130"), generation: "Gen 1", type: .Water, type2: .Flying),
            Pokemon(name: "Lapras", number: 131, image: UIImage(named: "131"), generation: "Gen 1", type: .Water, type2: .Ice),
            Pokemon(name: "Ditto", number: 132, image: UIImage(named: "132"), generation: "Gen 1", type: .Normal, type2: nil),
            Pokemon(name: "Eevee", number: 133, image: UIImage(named: "133"), generation: "Gen 1", type: .Normal, type2: nil),
            Pokemon(name: "Vaporeon", number: 134, image: UIImage(named: "134"), generation: "Gen 1", type: .Water, type2: nil),
            Pokemon(name: "Jolteon", number: 135, image: UIImage(named: "135"), generation: "Gen 1", type: .Electric, type2: nil),
            Pokemon(name: "Flareon", number: 136, image: UIImage(named: "136"), generation: "Gen 1", type: .Fire, type2: nil),
            Pokemon(name: "Porygon", number: 137, image: UIImage(named: "137"), generation: "Gen 1", type: .Normal, type2: nil),
            Pokemon(name: "Omanyte", number: 138, image: UIImage(named: "138"), generation: "Gen 1", type: .Rock, type2: .Water),
            Pokemon(name: "Omastar", number: 139, image: UIImage(named: "139"), generation: "Gen 1", type: .Rock, type2: .Water),
            Pokemon(name: "Kabuto", number: 140, image: UIImage(named: "140"), generation: "Gen 1", type: .Rock, type2: .Water),
            Pokemon(name: "Kabutops", number: 141, image: UIImage(named: "141"), generation: "Gen 1", type: .Rock, type2: .Water),
            Pokemon(name: "Aerodactyl", number: 142, image: UIImage(named: "142"), generation: "Gen 1", type: .Rock, type2: .Flying),
            Pokemon(name: "Snorlax", number: 143, image: UIImage(named: "143"), generation: "Gen 1", type: .Normal, type2: nil),
            Pokemon(name: "Articuno", number: 144, image: UIImage(named: "144"), generation: "Gen 1", type: .Ice, type2: .Flying),
            Pokemon(name: "Zapdos", number: 145, image: UIImage(named: "145"), generation: "Gen 1", type: .Electric, type2: .Flying),
            Pokemon(name: "Moltres", number: 146, image: UIImage(named: "146"), generation: "Gen 1", type: .Fire, type2: .Flying),
            Pokemon(name: "Dratini", number: 147, image: UIImage(named: "147"), generation: "Gen 1", type: .Dragon, type2: nil),
            Pokemon(name: "Dragonair", number: 148, image: UIImage(named: "148"), generation: "Gen 1", type: .Dragon, type2: nil),
            Pokemon(name: "Dragonite", number: 149, image: UIImage(named: "149"), generation: "Gen 1", type: .Dragon, type2: .Flying),
            Pokemon(name: "Mewtwo", number: 150, image: UIImage(named: "150"), generation: "Gen 1", type: .Psychic, type2: nil),
            Pokemon(name: "Mew", number: 151, image: UIImage(named: "151"), generation: "Gen 1", type: .Psychic, type2: nil),

            
            // MARK: Gen 2 ////////////////////////////////////////////////////////////////////////////////////////////////////////

            
            Pokemon(name: "Chikorita", number: 152, image: UIImage(named: "152"), generation: "Gen 2", type: .Grass, type2: nil),
            Pokemon(name: "Bayleef", number: 153, image: UIImage(named: "153"), generation: "Gen 2", type: .Grass, type2: nil),
            Pokemon(name: "Meganium", number: 154, image: UIImage(named: "154"), generation: "Gen 2", type: .Grass, type2: nil),
            Pokemon(name: "Cyndaquil", number: 155, image: UIImage(named: "155"), generation: "Gen 2", type: .Grass, type2: nil),
            Pokemon(name: "Quilava", number: 156, image: UIImage(named: "156"), generation: "Gen 2", type: .Fire, type2: nil),
            Pokemon(name: "Typhlosion", number: 157, image: UIImage(named: "157"), generation: "Gen 2", type: .Fire, type2: nil),
            Pokemon(name: "Totodile", number: 158, image: UIImage(named: "158"), generation: "Gen 2", type: .Water, type2: nil),
            Pokemon(name: "Croconaw", number: 159, image: UIImage(named: "159"), generation: "Gen 2", type: .Water, type2: nil),
            Pokemon(name: "Feraligatr", number: 160, image: UIImage(named: "160"), generation: "Gen 2", type: .Water, type2: nil),
            Pokemon(name: "Sentret", number: 161, image: UIImage(named: "161"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Furret", number: 162, image: UIImage(named: "162"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Hoothoot", number: 163, image: UIImage(named: "163"), generation: "Gen 2", type: .Normal, type2: .Flying),
            Pokemon(name: "Noctowl", number: 164, image: UIImage(named: "164"), generation: "Gen 2", type: .Normal, type2: .Flying),
            Pokemon(name: "Ledyba", number: 165, image: UIImage(named: "165"), generation: "Gen 2", type: .Bug, type2: .Flying),
            Pokemon(name: "Ledian", number: 166, image: UIImage(named: "166"), generation: "Gen 2", type: .Bug, type2: .Flying),
            Pokemon(name: "Spinarak", number: 167, image: UIImage(named: "167"), generation: "Gen 2", type: .Bug, type2: .Poison),
            Pokemon(name: "Ariados", number: 168, image: UIImage(named: "168"), generation: "Gen 2", type: .Bug, type2: .Poison),
            Pokemon(name: "Crobat", number: 169, image: UIImage(named: "169"), generation: "Gen 2", type: .Poison, type2: .Flying),
            Pokemon(name: "Chinchou", number: 170, image: UIImage(named: "170"), generation: "Gen 2", type: .Water, type2: .Electric),
            Pokemon(name: "Lanturn", number: 171, image: UIImage(named: "171"), generation: "Gen 2", type: .Water, type2: .Electric),
            Pokemon(name: "Pichu", number: 172, image: UIImage(named: "172"), generation: "Gen 2", type: .Electric, type2: nil),
            Pokemon(name: "Cleffa", number: 173, image: UIImage(named: "173"), generation: "Gen 2", type: .Fairy, type2: nil),
            Pokemon(name: "Igglybuff", number: 174, image: UIImage(named: "174"), generation: "Gen 2", type: .Fairy, type2: .Flying),
            Pokemon(name: "Togepi", number: 175, image: UIImage(named: "175"), generation: "Gen 2", type: .Fairy, type2: nil),
            Pokemon(name: "Togetic", number: 176, image: UIImage(named: "176"), generation: "Gen 2", type: .Fairy, type2: .Flying),
            Pokemon(name: "Natu", number: 177, image: UIImage(named: "177"), generation: "Gen 2", type: .Psychic, type2: .Flying),
            Pokemon(name: "Xatu", number: 178, image: UIImage(named: "178"), generation: "Gen 2", type: .Psychic, type2: .Flying),
            Pokemon(name: "Mareep", number: 179, image: UIImage(named: "179"), generation: "Gen 2", type: .Electric, type2: nil),
            Pokemon(name: "Flaaffy", number: 180, image: UIImage(named: "180"), generation: "Gen 2", type: .Electric, type2: nil),
            Pokemon(name: "Ampharos", number: 181, image: UIImage(named: "181"), generation: "Gen 2", type: .Electric, type2: nil),
            Pokemon(name: "Bellossom", number: 182, image: UIImage(named: "182"), generation: "Gen 2", type: .Grass, type2: nil),
            Pokemon(name: "Marill", number: 183, image: UIImage(named: "183"), generation: "Gen 2", type: .Water, type2: .Fairy),
            Pokemon(name: "Azumarill", number: 184, image: UIImage(named: "184"), generation: "Gen 2", type: .Water, type2: .Fairy),
            Pokemon(name: "Sudowoodo", number: 185, image: UIImage(named: "185"), generation: "Gen 2", type: .Rock, type2: nil),
            Pokemon(name: "Politoed", number: 186, image: UIImage(named: "186"), generation: "Gen 2", type: .Water, type2: nil),
            Pokemon(name: "Hoppip", number: 187, image: UIImage(named: "187"), generation: "Gen 2", type: .Grass, type2: .Flying),
            Pokemon(name: "Skiploom", number: 188, image: UIImage(named: "188"), generation: "Gen 2", type: .Grass, type2: .Flying),
            Pokemon(name: "Jumpluff", number: 189, image: UIImage(named: "189"), generation: "Gen 2", type: .Grass, type2: .Flying),
            Pokemon(name: "Aipom", number: 190, image: UIImage(named: "190"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Sunkern", number: 191, image: UIImage(named: "191"), generation: "Gen 2", type: .Grass, type2: nil),
            Pokemon(name: "Sunflora", number: 192, image: UIImage(named: "192"), generation: "Gen 2", type: .Grass, type2: nil),
            Pokemon(name: "Yanma", number: 193, image: UIImage(named: "193"), generation: "Gen 2", type: .Bug, type2: .Flying),
            Pokemon(name: "Wooper", number: 194, image: UIImage(named: "194"), generation: "Gen 2", type: .Water, type2: .Ground),
            Pokemon(name: "Quagsire", number: 195, image: UIImage(named: "195"), generation: "Gen 2", type: .Water, type2: .Ground),
            Pokemon(name: "Espeon", number: 196, image: UIImage(named: "196"), generation: "Gen 2", type: .Psychic, type2: nil),
            Pokemon(name: "Umbreon", number: 197, image: UIImage(named: "197"), generation: "Gen 2", type: .Dark, type2: nil),
            Pokemon(name: "Murkrow", number: 198, image: UIImage(named: "198"), generation: "Gen 2", type: .Dark, type2: .Flying),
            Pokemon(name: "Slowking", number: 199, image: UIImage(named: "199"), generation: "Gen 2", type: .Water, type2: .Psychic),
            Pokemon(name: "Misdreavus", number: 200, image: UIImage(named: "200"), generation: "Gen 2", type: .Ghost, type2: nil),
            Pokemon(name: "Unown", number: 201, image: UIImage(named: "201"), generation: "Gen 2", type: .Psychic, type2: nil),
            Pokemon(name: "Wobbuffet", number: 202, image: UIImage(named: "202"), generation: "Gen 2", type: .Psychic, type2: nil),
            Pokemon(name: "Girafarig", number: 203, image: UIImage(named: "203"), generation: "Gen 2", type: .Normal, type2: .Psychic),
            Pokemon(name: "Pineco", number: 204, image: UIImage(named: "204"), generation: "Gen 2", type: .Bug, type2: nil),
            Pokemon(name: "Forretress", number: 205, image: UIImage(named: "205"), generation: "Gen 2", type: .Bug, type2: .Steel),
            Pokemon(name: "Dunsparce", number: 206, image: UIImage(named: "206"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Gligar", number: 207, image: UIImage(named: "207"), generation: "Gen 2", type: .Ground, type2: .Flying),
            Pokemon(name: "Steelix", number: 208, image: UIImage(named: "208"), generation: "Gen 2", type: .Steel, type2: .Ground),
            Pokemon(name: "Snubbull", number: 209, image: UIImage(named: "209"), generation: "Gen 2", type: .Fairy, type2: nil),
            Pokemon(name: "Granbull", number: 210, image: UIImage(named: "210"), generation: "Gen 2", type: .Fairy, type2: nil),
            Pokemon(name: "Qwilfish", number: 211, image: UIImage(named: "211"), generation: "Gen 2", type: .Water, type2: .Poison),
            Pokemon(name: "Scizor", number: 212, image: UIImage(named: "212"), generation: "Gen 2", type: .Bug, type2: .Steel),
            Pokemon(name: "Shuckle", number: 213, image: UIImage(named: "213"), generation: "Gen 2", type: .Bug, type2: .Rock),
            Pokemon(name: "Heracross", number: 214, image: UIImage(named: "214"), generation: "Gen 2", type: .Bug, type2: .Fighting),
            Pokemon(name: "Sneasel", number: 215, image: UIImage(named: "215"), generation: "Gen 2", type: .Dark, type2: .Ice),
            Pokemon(name: "Teddiursa", number: 216, image: UIImage(named: "216"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Ursaring", number: 217, image: UIImage(named: "217"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Slugma", number: 218, image: UIImage(named: "218"), generation: "Gen 2", type: .Fire, type2: nil),
            Pokemon(name: "Magcargo", number: 219, image: UIImage(named: "219"), generation: "Gen 2", type: .Fire, type2: .Rock),
            Pokemon(name: "Swinub", number: 220, image: UIImage(named: "220"), generation: "Gen 2", type: .Ice, type2: .Ground),
            Pokemon(name: "Piloswine", number: 221, image: UIImage(named: "221"), generation: "Gen 2", type: .Ice, type2: .Ground),
            Pokemon(name: "Corsola", number: 222, image: UIImage(named: "222"), generation: "Gen 2", type: .Water, type2: .Rock),
            Pokemon(name: "Remoraid", number: 223, image: UIImage(named: "223"), generation: "Gen 2", type: .Water, type2: nil),
            Pokemon(name: "Octillery", number: 224, image: UIImage(named: "224"), generation: "Gen 2", type: .Water, type2: nil),
            Pokemon(name: "Delibird", number: 225, image: UIImage(named: "225"), generation: "Gen 2", type: .Ice, type2: .Flying),
            Pokemon(name: "Mantine", number: 226, image: UIImage(named: "226"), generation: "Gen 2", type: .Water, type2: .Flying),
            Pokemon(name: "Skarmory", number: 227, image: UIImage(named: "227"), generation: "Gen 2", type: .Steel, type2: .Flying),
            Pokemon(name: "Houndour", number: 228, image: UIImage(named: "228"), generation: "Gen 2", type: .Dark, type2: .Fire),
            Pokemon(name: "Houndoom", number: 229, image: UIImage(named: "229"), generation: "Gen 2", type: .Dark, type2: .Fire),
            Pokemon(name: "Kingdra", number: 230, image: UIImage(named: "230"), generation: "Gen 2", type: .Water, type2: .Dragon),
            Pokemon(name: "Phanpy", number: 231, image: UIImage(named: "231"), generation: "Gen 2", type: .Ground, type2: nil),
            Pokemon(name: "Donphan", number: 232, image: UIImage(named: "232"), generation: "Gen 2", type: .Ground, type2: nil),
            Pokemon(name: "Porygon2", number: 233, image: UIImage(named: "233"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Stantler", number: 234, image: UIImage(named: "234"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Smeargle", number: 235, image: UIImage(named: "235"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Tyrogue", number: 236, image: UIImage(named: "236"), generation: "Gen 2", type: .Fighting, type2: nil),
            Pokemon(name: "Hitmontop", number: 237, image: UIImage(named: "237"), generation: "Gen 2", type: .Fighting, type2: nil),
            Pokemon(name: "Smoochum", number: 238, image: UIImage(named: "238"), generation: "Gen 2", type: .Ice, type2: .Psychic),
            Pokemon(name: "Elekid", number: 239, image: UIImage(named: "239"), generation: "Gen 2", type: .Electric, type2: nil),
            Pokemon(name: "Magby", number: 240, image: UIImage(named: "240"), generation: "Gen 2", type: .Fire, type2: nil),
            Pokemon(name: "Miltank", number: 241, image: UIImage(named: "241"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Blissey", number: 242, image: UIImage(named: "242"), generation: "Gen 2", type: .Normal, type2: nil),
            Pokemon(name: "Raikou", number: 243, image: UIImage(named: "243"), generation: "Gen 2", type: .Electric, type2: nil),
            Pokemon(name: "Entei", number: 244, image: UIImage(named: "244"), generation: "Gen 2", type: .Fire, type2: nil),
            Pokemon(name: "Suicune", number: 245, image: UIImage(named: "245"), generation: "Gen 2", type: .Water, type2: nil),
            Pokemon(name: "Larvitar", number: 246, image: UIImage(named: "246"), generation: "Gen 2", type: .Rock, type2: .Ground),
            Pokemon(name: "Pupitar", number: 247, image: UIImage(named: "247"), generation: "Gen 2", type: .Rock, type2: .Ground),
            Pokemon(name: "Tyranitar", number: 248, image: UIImage(named: "248"), generation: "Gen 2", type: .Rock, type2: .Dark),
            Pokemon(name: "Lugia", number: 249, image: UIImage(named: "249"), generation: "Gen 2", type: .Psychic, type2: .Flying),
            Pokemon(name: "Ho-Oh", number: 250, image: UIImage(named: "250"), generation: "Gen 2", type: .Fire, type2: .Flying),
            Pokemon(name: "Celebi", number: 251, image: UIImage(named: "251"), generation: "Gen 2", type: .Psychic, type2: .Grass),

            
            // MARK: Gen 3 ////////////////////////////////////////////////////////////////////////////////////////////////////////

            
            Pokemon(name: "Treecko", number: 252, image: UIImage(named: "252"), generation: "Gen 3", type: .Grass, type2: nil),
            Pokemon(name: "Grovyle", number: 253, image: UIImage(named: "253"), generation: "Gen 3", type: .Grass, type2: nil),
            Pokemon(name: "Sceptile", number: 254, image: UIImage(named: "254"), generation: "Gen 3", type: .Grass, type2: nil),
            Pokemon(name: "Torchic", number: 255, image: UIImage(named: "255"), generation: "Gen 3", type: .Fire, type2: nil),
            Pokemon(name: "Combusken", number: 256, image: UIImage(named: "256"), generation: "Gen 3", type: .Fire, type2: .Fighting),
            Pokemon(name: "Blaziken", number: 257, image: UIImage(named: "257"), generation: "Gen 3", type: .Fire, type2: .Fighting),
            Pokemon(name: "Mudkip", number: 258, image: UIImage(named: "258"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Marshtomp", number: 259, image: UIImage(named: "259"), generation: "Gen 3", type: .Water, type2: .Ground),
            Pokemon(name: "Swampert", number: 260, image: UIImage(named: "260"), generation: "Gen 3", type: .Water, type2: .Ground),
            Pokemon(name: "Poochyena", number: 261, image: UIImage(named: "261"), generation: "Gen 3", type: .Dark, type2: nil),
            Pokemon(name: "Mightyena", number: 262, image: UIImage(named: "262"), generation: "Gen 3", type: .Dark, type2: nil),
            Pokemon(name: "Zigzagoon", number: 263, image: UIImage(named: "263"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Linoone", number: 264, image: UIImage(named: "264"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Wurmple", number: 265, image: UIImage(named: "265"), generation: "Gen 3", type: .Bug, type2: nil),
            Pokemon(name: "Silcoon", number: 266, image: UIImage(named: "266"), generation: "Gen 3", type: .Bug, type2: nil),
            Pokemon(name: "Beautifly", number: 267, image: UIImage(named: "267"), generation: "Gen 3", type: .Bug, type2: .Flying),
            Pokemon(name: "Cascoon", number: 268, image: UIImage(named: "268"), generation: "Gen 3", type: .Bug, type2: nil),
            Pokemon(name: "Dustox", number: 269, image: UIImage(named: "269"), generation: "Gen 3", type: .Bug, type2: .Poison),
            Pokemon(name: "Lotad", number: 270, image: UIImage(named: "270"), generation: "Gen 3", type: .Water, type2: .Grass),
            Pokemon(name: "Lombre", number: 271, image: UIImage(named: "271"), generation: "Gen 3", type: .Water, type2: .Grass),
            Pokemon(name: "Ludicolo", number: 272, image: UIImage(named: "272"), generation: "Gen 3", type: .Water, type2: .Grass),
            Pokemon(name: "Seedot", number: 273, image: UIImage(named: "273"), generation: "Gen 3", type: .Grass, type2: nil),
            Pokemon(name: "Nuzleaf", number: 274, image: UIImage(named: "274"), generation: "Gen 3", type: .Grass, type2: .Dark),
            Pokemon(name: "Shiftry", number: 275, image: UIImage(named: "275"), generation: "Gen 3", type: .Grass, type2: .Dark),
            Pokemon(name: "Taillow", number: 276, image: UIImage(named: "276"), generation: "Gen 3", type: .Normal, type2: .Flying),
            Pokemon(name: "Swellow", number: 277, image: UIImage(named: "277"), generation: "Gen 3", type: .Normal, type2: .Flying),
            Pokemon(name: "Wingull", number: 278, image: UIImage(named: "278"), generation: "Gen 3", type: .Water, type2: .Flying),
            Pokemon(name: "Pelipper", number: 279, image: UIImage(named: "279"), generation: "Gen 3", type: .Water, type2: .Flying),
            Pokemon(name: "Ralts", number: 280, image: UIImage(named: "280"), generation: "Gen 3", type: .Psychic, type2: .Fairy),
            Pokemon(name: "Kirlia", number: 281, image: UIImage(named: "281"), generation: "Gen 3", type: .Psychic, type2: .Fairy),
            Pokemon(name: "Gardevoir", number: 282, image: UIImage(named: "282"), generation: "Gen 3", type: .Psychic, type2: .Fairy),
            Pokemon(name: "Surskit", number: 283, image: UIImage(named: "283"), generation: "Gen 3", type: .Bug, type2: .Water),
            Pokemon(name: "Masquerain", number: 284, image: UIImage(named: "284"), generation: "Gen 3", type: .Bug, type2: .Flying),
            Pokemon(name: "Shroomish", number: 285, image: UIImage(named: "285"), generation: "Gen 3", type: .Grass, type2: nil),
            Pokemon(name: "Breloom", number: 286, image: UIImage(named: "286"), generation: "Gen 3", type: .Grass, type2: .Fighting),
            Pokemon(name: "Slakoth", number: 287, image: UIImage(named: "287"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Vigoroth", number: 288, image: UIImage(named: "288"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Slaking", number: 289, image: UIImage(named: "289"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Nincada", number: 290, image: UIImage(named: "290"), generation: "Gen 3", type: .Bug, type2: .Ground),
            Pokemon(name: "Ninjask", number: 291, image: UIImage(named: "291"), generation: "Gen 3", type: .Bug, type2: .Flying),
            Pokemon(name: "Shedinja", number: 292, image: UIImage(named: "292"), generation: "Gen 3", type: .Bug, type2: .Ghost),
            Pokemon(name: "Whismur", number: 293, image: UIImage(named: "293"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Loudred", number: 294, image: UIImage(named: "294"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Exploud", number: 295, image: UIImage(named: "295"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Makuhita", number: 296, image: UIImage(named: "296"), generation: "Gen 3", type: .Fighting, type2: nil),
            Pokemon(name: "Hariyama", number: 297, image: UIImage(named: "297"), generation: "Gen 3", type: .Fighting, type2: nil),
            Pokemon(name: "Azurill", number: 298, image: UIImage(named: "298"), generation: "Gen 3", type: .Normal, type2: .Fairy),
            Pokemon(name: "Nosepass", number: 299, image: UIImage(named: "299"), generation: "Gen 3", type: .Rock, type2: nil),
            Pokemon(name: "Skitty", number: 300, image: UIImage(named: "300"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Delcatty", number: 301, image: UIImage(named: "301"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Sableye", number: 302, image: UIImage(named: "302"), generation: "Gen 3", type: .Dark, type2: .Ghost),
            Pokemon(name: "Mawile", number: 303, image: UIImage(named: "303"), generation: "Gen 3", type: .Steel, type2: .Fairy),
            Pokemon(name: "Aron", number: 304, image: UIImage(named: "304"), generation: "Gen 3", type: .Steel, type2: .Rock),
            Pokemon(name: "Lairon", number: 305, image: UIImage(named: "305"), generation: "Gen 3", type: .Steel, type2: .Rock),
            Pokemon(name: "Aggron", number: 306, image: UIImage(named: "306"), generation: "Gen 3", type: .Steel, type2: .Rock),
            Pokemon(name: "Meditite", number: 307, image: UIImage(named: "307"), generation: "Gen 3", type: .Fighting, type2: .Psychic),
            Pokemon(name: "Medicham", number: 308, image: UIImage(named: "308"), generation: "Gen 3", type: .Fighting, type2: .Psychic),
            Pokemon(name: "Electrike", number: 309, image: UIImage(named: "309"), generation: "Gen 3", type: .Electric, type2: nil),
            Pokemon(name: "Manectric", number: 310, image: UIImage(named: "310"), generation: "Gen 3", type: .Electric, type2: nil),
            Pokemon(name: "Plusle", number: 311, image: UIImage(named: "311"), generation: "Gen 3", type: .Electric, type2: nil),
            Pokemon(name: "Minun", number: 312, image: UIImage(named: "312"), generation: "Gen 3", type: .Electric, type2: nil),
            Pokemon(name: "Volbeat", number: 313, image: UIImage(named: "313"), generation: "Gen 3", type: .Bug, type2: nil),
            Pokemon(name: "Illumise", number: 314, image: UIImage(named: "314"), generation: "Gen 3", type: .Bug, type2: nil),
            Pokemon(name: "Roselia", number: 315, image: UIImage(named: "315"), generation: "Gen 3", type: .Grass, type2: .Poison),
            Pokemon(name: "Gulpin", number: 316, image: UIImage(named: "316"), generation: "Gen 3", type: .Poison, type2: nil),
            Pokemon(name: "Swalot", number: 317, image: UIImage(named: "317"), generation: "Gen 3", type: .Poison, type2: nil),
            Pokemon(name: "Carvanha", number: 318, image: UIImage(named: "318"), generation: "Gen 3", type: .Water, type2: .Dark),
            Pokemon(name: "Sharpedo", number: 319, image: UIImage(named: "319"), generation: "Gen 3", type: .Water, type2: .Dark),
            Pokemon(name: "Wailmer", number: 320, image: UIImage(named: "320"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Wailord", number: 321, image: UIImage(named: "321"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Numel", number: 322, image: UIImage(named: "322"), generation: "Gen 3", type: .Fire, type2: .Ground),
            Pokemon(name: "Camerupt", number: 323, image: UIImage(named: "323"), generation: "Gen 3", type: .Fire, type2: .Ground),
            Pokemon(name: "Torkoal", number: 324, image: UIImage(named: "324"), generation: "Gen 3", type: .Fire, type2: nil),
            Pokemon(name: "Spoink", number: 325, image: UIImage(named: "325"), generation: "Gen 3", type: .Psychic, type2: nil),
            Pokemon(name: "Grumpig", number: 326, image: UIImage(named: "326"), generation: "Gen 3", type: .Psychic, type2: nil),
            Pokemon(name: "Spinda", number: 327, image: UIImage(named: "327"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Trapinch", number: 328, image: UIImage(named: "328"), generation: "Gen 3", type: .Ground, type2: nil),
            Pokemon(name: "Vibrava", number: 329, image: UIImage(named: "329"), generation: "Gen 3", type: .Ground, type2: .Dragon),
            Pokemon(name: "Flygon", number: 330, image: UIImage(named: "330"), generation: "Gen 3", type: .Ground, type2: .Dragon),
            Pokemon(name: "Cacnea", number: 331, image: UIImage(named: "331"), generation: "Gen 3", type: .Grass, type2: nil),
            Pokemon(name: "Cacturne", number: 332, image: UIImage(named: "332"), generation: "Gen 3", type: .Grass, type2: .Dark),
            Pokemon(name: "Swablu", number: 333, image: UIImage(named: "333"), generation: "Gen 3", type: .Normal, type2: .Flying),
            Pokemon(name: "Altaria", number: 334, image: UIImage(named: "334"), generation: "Gen 3", type: .Dragon, type2: .Flying),
            Pokemon(name: "Zangoose", number: 335, image: UIImage(named: "335"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Seviper", number: 336, image: UIImage(named: "336"), generation: "Gen 3", type: .Poison, type2: nil),
            Pokemon(name: "Lunatone", number: 337, image: UIImage(named: "337"), generation: "Gen 3", type: .Rock, type2: .Psychic),
            Pokemon(name: "Solrock", number: 338, image: UIImage(named: "338"), generation: "Gen 3", type: .Rock, type2: .Psychic),
            Pokemon(name: "Barboach", number: 339, image: UIImage(named: "339"), generation: "Gen 3", type: .Water, type2: .Ground),
            Pokemon(name: "Whiscash", number: 340, image: UIImage(named: "340"), generation: "Gen 3", type: .Water, type2: .Ground),
            Pokemon(name: "Corphish", number: 341, image: UIImage(named: "341"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Crawdaunt", number: 342, image: UIImage(named: "342"), generation: "Gen 3", type: .Water, type2: .Dark),
            Pokemon(name: "Baltoy", number: 343, image: UIImage(named: "343"), generation: "Gen 3", type: .Ground, type2: .Psychic),
            Pokemon(name: "Claydol", number: 344, image: UIImage(named: "344"), generation: "Gen 3", type: .Ground, type2: .Psychic),
            Pokemon(name: "Lileep", number: 345, image: UIImage(named: "345"), generation: "Gen 3", type: .Rock, type2: .Grass),
            Pokemon(name: "Cradily", number: 346, image: UIImage(named: "346"), generation: "Gen 3", type: .Rock, type2: .Grass),
            Pokemon(name: "Anorith", number: 347, image: UIImage(named: "347"), generation: "Gen 3", type: .Rock, type2: .Bug),
            Pokemon(name: "Armaldo", number: 348, image: UIImage(named: "348"), generation: "Gen 3", type: .Rock, type2: .Bug),
            Pokemon(name: "Feebas", number: 349, image: UIImage(named: "349"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Milotic", number: 350, image: UIImage(named: "350"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Castform", number: 351, image: UIImage(named: "351"), generation: "Gen 3", type: .Normal, type2: nil),
//            Pokemon(name: "Castform (Sunny)", number: 351, image: UIImage(named: "351-sunny"), generation: "Gen 3", type: .Fire, type2: nil),
//            Pokemon(name: "Castform (Rainy)", number: 351, image: UIImage(named: "351-rainy"), generation: "Gen 3", type: .Water, type2: nil),
//            Pokemon(name: "Castform (Snowy)", number: 351, image: UIImage(named: "351-snowy"), generation: "Gen 3", type: .Ice, type2: nil),
            Pokemon(name: "Kecleon", number: 352, image: UIImage(named: "352"), generation: "Gen 3", type: .Normal, type2: nil),
            Pokemon(name: "Shuppet", number: 353, image: UIImage(named: "353"), generation: "Gen 3", type: .Ghost, type2: nil),
            Pokemon(name: "Banette", number: 354, image: UIImage(named: "354"), generation: "Gen 3", type: .Ghost, type2: nil),
            Pokemon(name: "Duskull", number: 355, image: UIImage(named: "355"), generation: "Gen 3", type: .Ghost, type2: nil),
            Pokemon(name: "Dusclops", number: 356, image: UIImage(named: "356"), generation: "Gen 3", type: .Ghost, type2: nil),
            Pokemon(name: "Tropius", number: 357, image: UIImage(named: "357"), generation: "Gen 3", type: .Grass, type2: .Flying),
            Pokemon(name: "Chimecho", number: 358, image: UIImage(named: "358"), generation: "Gen 3", type: .Psychic, type2: nil),
            Pokemon(name: "Absol", number: 359, image: UIImage(named: "359"), generation: "Gen 3", type: .Dark, type2: nil),
            Pokemon(name: "Wynaut", number: 360, image: UIImage(named: "360"), generation: "Gen 3", type: .Psychic, type2: nil),
            Pokemon(name: "Snorunt", number: 361, image: UIImage(named: "361"), generation: "Gen 3", type: .Ice, type2: nil),
            Pokemon(name: "Glalie", number: 362, image: UIImage(named: "362"), generation: "Gen 3", type: .Ice, type2: nil),
            Pokemon(name: "Spheal", number: 363, image: UIImage(named: "363"), generation: "Gen 3", type: .Ice, type2: .Water),
            Pokemon(name: "Sealeo", number: 364, image: UIImage(named: "364"), generation: "Gen 3", type: .Ice, type2: .Water),
            Pokemon(name: "Walrein", number: 365, image: UIImage(named: "365"), generation: "Gen 3", type: .Ice, type2: .Water),
            Pokemon(name: "Clamperl", number: 366, image: UIImage(named: "366"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Huntail", number: 367, image: UIImage(named: "367"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Gorebyss", number: 368, image: UIImage(named: "368"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Relicanth", number: 369, image: UIImage(named: "369"), generation: "Gen 3", type: .Water, type2: .Rock),
            Pokemon(name: "Luvdisc", number: 370, image: UIImage(named: "370"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Bagon", number: 371, image: UIImage(named: "371"), generation: "Gen 3", type: .Dragon, type2: nil),
            Pokemon(name: "Shelgon", number: 372, image: UIImage(named: "372"), generation: "Gen 3", type: .Dragon, type2: nil),
            Pokemon(name: "Salamence", number: 373, image: UIImage(named: "373"), generation: "Gen 3", type: .Dragon, type2: .Flying),
            Pokemon(name: "Beldum", number: 374, image: UIImage(named: "374"), generation: "Gen 3", type: .Steel, type2: .Psychic),
            Pokemon(name: "Metang", number: 375, image: UIImage(named: "375"), generation: "Gen 3", type: .Steel, type2: .Psychic),
            Pokemon(name: "Metagross", number: 376, image: UIImage(named: "376"), generation: "Gen 3", type: .Steel, type2: .Psychic),
            Pokemon(name: "Regirock", number: 377, image: UIImage(named: "377"), generation: "Gen 3", type: .Rock, type2: nil),
            Pokemon(name: "Regice", number: 378, image: UIImage(named: "378"), generation: "Gen 3", type: .Ice, type2: nil),
            Pokemon(name: "Registeel", number: 379, image: UIImage(named: "379"), generation: "Gen 3", type: .Steel, type2: nil),
            Pokemon(name: "Latias", number: 380, image: UIImage(named: "380"), generation: "Gen 3", type: .Dragon, type2: .Psychic),
            Pokemon(name: "Latios", number: 381, image: UIImage(named: "381"), generation: "Gen 3", type: .Dragon, type2: .Psychic),
            Pokemon(name: "Kyogre", number: 382, image: UIImage(named: "382"), generation: "Gen 3", type: .Water, type2: nil),
            Pokemon(name: "Groudon", number: 383, image: UIImage(named: "383"), generation: "Gen 3", type: .Ground, type2: nil),
            Pokemon(name: "Rayquaza", number: 384, image: UIImage(named: "384"), generation: "Gen 3", type: .Dragon, type2: .Flying),
            Pokemon(name: "Jirachi", number: 385, image: UIImage(named: "385"), generation: "Gen 3", type: .Steel, type2: .Psychic),
            Pokemon(name: "Deoxys", number: 386, image: UIImage(named: "386"), generation: "Gen 3", type: .Psychic, type2: nil),
//            Pokemon(name: "Deoxys (Attack)", number: 386, image: UIImage(named: "386-attack"), generation: "Gen 3", type: .Psychic, type2: nil),
//            Pokemon(name: "Deoxys (Defense)", number: 386, image: UIImage(named: "386-defense"), generation: "Gen 3", type: .Psychic, type2: nil),
//            Pokemon(name: "Deoxys (Speed)", number: 386, image: UIImage(named: "386-speed"), generation: "Gen 3", type: .Psychic, type2: nil),

            
            // MARK: Gen 4 ////////////////////////////////////////////////////////////////////////////////////////////////////////
            
            
            Pokemon(name: "Turtwig", number: 387, image: UIImage(named: "387"), generation: "Gen 4", type: .Grass, type2: nil),
            Pokemon(name: "Grotle", number: 388, image: UIImage(named: "388"), generation: "Gen 4", type: .Grass, type2: nil),
            Pokemon(name: "Torterra", number: 389, image: UIImage(named: "389"), generation: "Gen 4", type: .Grass, type2: .Ground),
            Pokemon(name: "Chimchar", number: 390, image: UIImage(named: "390"), generation: "Gen 4", type: .Fire, type2: nil),
            Pokemon(name: "Monferno", number: 391, image: UIImage(named: "391"), generation: "Gen 4", type: .Fire, type2: .Fighting),
            Pokemon(name: "Infernape", number: 392, image: UIImage(named: "392"), generation: "Gen 4", type: .Fire, type2: .Fighting),
            Pokemon(name: "Piplup", number: 393, image: UIImage(named: "393"), generation: "Gen 4", type: .Water, type2: nil),
            Pokemon(name: "Prinplup", number: 394, image: UIImage(named: "394"), generation: "Gen 4", type: .Water, type2: nil),
            Pokemon(name: "Empoleon", number: 395, image: UIImage(named: "395"), generation: "Gen 4", type: .Water, type2: .Steel),
            Pokemon(name: "Starly", number: 396, image: UIImage(named: "396"), generation: "Gen 4", type: .Normal, type2: .Flying),
            Pokemon(name: "Staravia", number: 397, image: UIImage(named: "397"), generation: "Gen 4", type: .Normal, type2: .Flying),
            Pokemon(name: "Staraptor", number: 398, image: UIImage(named: "398"), generation: "Gen 4", type: .Normal, type2: .Flying),
            Pokemon(name: "Bidoof", number: 399, image: UIImage(named: "399"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Bibarel", number: 400, image: UIImage(named: "400"), generation: "Gen 4", type: .Normal, type2: .Water),
            Pokemon(name: "Kricketot", number: 401, image: UIImage(named: "401"), generation: "Gen 4", type: .Bug, type2: nil),
            Pokemon(name: "Kricketune", number: 402, image: UIImage(named: "402"), generation: "Gen 4", type: .Bug, type2: nil),
            Pokemon(name: "Shinx", number: 403, image: UIImage(named: "403"), generation: "Gen 4", type: .Electric, type2: nil),
            Pokemon(name: "Luxio", number: 404, image: UIImage(named: "404"), generation: "Gen 4", type: .Electric, type2: nil),
            Pokemon(name: "Luxray", number: 405, image: UIImage(named: "405"), generation: "Gen 4", type: .Electric, type2: nil),
            Pokemon(name: "Budew", number: 406, image: UIImage(named: "406"), generation: "Gen 4", type: .Grass, type2: .Poison),
            Pokemon(name: "Roserade", number: 407, image: UIImage(named: "407"), generation: "Gen 4", type: .Grass, type2: .Poison),
            Pokemon(name: "Cranidos", number: 408, image: UIImage(named: "408"), generation: "Gen 4", type: .Rock, type2: nil),
            Pokemon(name: "Rampardos", number: 409, image: UIImage(named: "409"), generation: "Gen 4", type: .Rock, type2: nil),
            Pokemon(name: "Shieldon", number: 410, image: UIImage(named: "410"), generation: "Gen 4", type: .Rock, type2: .Steel),
            Pokemon(name: "Bastiodon", number: 411, image: UIImage(named: "411"), generation: "Gen 4", type: .Rock, type2: .Steel),
            Pokemon(name: "Burmy", number: 412, image: UIImage(named: "412-plant"), generation: "Gen 4", type: .Bug, type2: nil),
            //Pokemon(name: "Burmy (Sandy)", number: 412, image: UIImage(named: "412-sandy"), generation: "Gen 4", type: .Bug, type2: nil),
            //Pokemon(name: "Burmy (Trash)", number: 412, image: UIImage(named: "412-trash"), generation: "Gen 4", type: .Bug, type2: nil),
            Pokemon(name: "Wormadam", number: 413, image: UIImage(named: "413-plant"), generation: "Gen 4", type: .Bug, type2: .Grass),
            //Pokemon(name: "Wormadam (Sandy)", number: 413, image: UIImage(named: "413-sandy"), generation: "Gen 4", type: .Bug, type2: .Ground),
            //Pokemon(name: "Wormadam (Trash)", number: 413, image: UIImage(named: "413-trash"), generation: "Gen 4", type: .Bug, type2: .Steel),
            Pokemon(name: "Mothim", number: 414, image: UIImage(named: "414"), generation: "Gen 4", type: .Bug, type2: .Flying),
            Pokemon(name: "Combee", number: 415, image: UIImage(named: "415"), generation: "Gen 4", type: .Bug, type2: .Flying),
            Pokemon(name: "Vespiquen", number: 416, image: UIImage(named: "416"), generation: "Gen 4", type: .Bug, type2: .Flying),
            Pokemon(name: "Pachirisu", number: 417, image: UIImage(named: "417"), generation: "Gen 4", type: .Electric, type2: nil),
            Pokemon(name: "Buizel", number: 418, image: UIImage(named: "418"), generation: "Gen 4", type: .Water, type2: nil),
            Pokemon(name: "Floatzel", number: 419, image: UIImage(named: "419"), generation: "Gen 4", type: .Water, type2: nil),
            Pokemon(name: "Cherubi", number: 420, image: UIImage(named: "420"), generation: "Gen 4", type: .Grass, type2: nil),
            Pokemon(name: "Cherrim (Overcast)", number: 421, image: UIImage(named: "421-overcast"), generation: "Gen 4", type: .Grass, type2: nil),
            Pokemon(name: "Cherrim (Sunshine)", number: 421, image: UIImage(named: "421-sunshine"), generation: "Gen 4", type: .Grass, type2: nil),
            Pokemon(name: "Shellos (West)", number: 422, image: UIImage(named: "422-west"), generation: "Gen 4", type: .Water, type2: nil),
            Pokemon(name: "Shellos (East)", number: 422, image: UIImage(named: "422-east"), generation: "Gen 4", type: .Water, type2: nil),
            Pokemon(name: "Gastrodon (West)", number: 423, image: UIImage(named: "423-west"), generation: "Gen 4", type: .Water, type2: .Ground),
            Pokemon(name: "Gastrodon (East)", number: 423, image: UIImage(named: "423-east"), generation: "Gen 4", type: .Water, type2: .Ground),
            Pokemon(name: "Ambipom", number: 424, image: UIImage(named: "424"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Drifloon", number: 425, image: UIImage(named: "425"), generation: "Gen 4", type: .Ghost, type2: .Flying),
            Pokemon(name: "Drifblim", number: 426, image: UIImage(named: "426"), generation: "Gen 4", type: .Ghost, type2: .Flying),
            Pokemon(name: "Buneary", number: 427, image: UIImage(named: "427"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Lopunny", number: 428, image: UIImage(named: "428"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Mismagius", number: 429, image: UIImage(named: "429"), generation: "Gen 4", type: .Ghost, type2: nil),
            Pokemon(name: "Honchkrow", number: 430, image: UIImage(named: "430"), generation: "Gen 4", type: .Dark, type2: .Flying),
            Pokemon(name: "Glameow", number: 431, image: UIImage(named: "431"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Purugly", number: 432, image: UIImage(named: "432"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Chingling", number: 433, image: UIImage(named: "433"), generation: "Gen 4", type: .Psychic, type2: nil),
            Pokemon(name: "Stunky", number: 434, image: UIImage(named: "434"), generation: "Gen 4", type: .Poison, type2: .Dark),
            Pokemon(name: "Skuntank", number: 435, image: UIImage(named: "435"), generation: "Gen 4", type: .Poison, type2: .Dark),
            Pokemon(name: "Bronzor", number: 436, image: UIImage(named: "436"), generation: "Gen 4", type: .Steel, type2: .Psychic),
            Pokemon(name: "Bronzong", number: 437, image: UIImage(named: "437"), generation: "Gen 4", type: .Steel, type2: .Psychic),
            Pokemon(name: "Bonsly", number: 438, image: UIImage(named: "438"), generation: "Gen 4", type: .Rock, type2: nil),
            Pokemon(name: "Mime Jr.", number: 439, image: UIImage(named: "439"), generation: "Gen 4", type: .Psychic, type2: .Fairy),
            Pokemon(name: "Happiny", number: 440, image: UIImage(named: "440"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Chatot", number: 441, image: UIImage(named: "441"), generation: "Gen 4", type: .Normal, type2: .Flying),
            Pokemon(name: "Spiritomb", number: 442, image: UIImage(named: "442"), generation: "Gen 4", type: .Ghost, type2: .Dark),
            Pokemon(name: "Gible", number: 443, image: UIImage(named: "443"), generation: "Gen 4", type: .Dragon, type2: .Ground),
            Pokemon(name: "Gabite", number: 444, image: UIImage(named: "444"), generation: "Gen 4", type: .Dragon, type2: .Ground),
            Pokemon(name: "Garchomp", number: 445, image: UIImage(named: "445"), generation: "Gen 4", type: .Dragon, type2: .Ground),
            Pokemon(name: "Munchlax", number: 446, image: UIImage(named: "446"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Riolu", number: 447, image: UIImage(named: "447"), generation: "Gen 4", type: .Fighting, type2: nil),
            Pokemon(name: "Lucario", number: 448, image: UIImage(named: "448"), generation: "Gen 4", type: .Fighting, type2: .Steel),
            Pokemon(name: "Hippopotas", number: 449, image: UIImage(named: "449"), generation: "Gen 4", type: .Ground, type2: nil),
            Pokemon(name: "Hippowdon", number: 450, image: UIImage(named: "450"), generation: "Gen 4", type: .Ground, type2: nil),
            Pokemon(name: "Skorupi", number: 451, image: UIImage(named: "451"), generation: "Gen 4", type: .Poison, type2: .Bug),
            Pokemon(name: "Drapion", number: 452, image: UIImage(named: "452"), generation: "Gen 4", type: .Poison, type2: .Dark),
            Pokemon(name: "Croagunk", number: 453, image: UIImage(named: "453"), generation: "Gen 4", type: .Poison, type2: .Fighting),
            Pokemon(name: "Toxicroak", number: 454, image: UIImage(named: "454"), generation: "Gen 4", type: .Poison, type2: .Fighting),
            Pokemon(name: "Carnivine", number: 455, image: UIImage(named: "455"), generation: "Gen 4", type: .Grass, type2: nil),
            Pokemon(name: "Finneon", number: 456, image: UIImage(named: "456"), generation: "Gen 4", type: .Water, type2: nil),
            Pokemon(name: "Lumineon", number: 457, image: UIImage(named: "457"), generation: "Gen 4", type: .Water, type2: nil),
            Pokemon(name: "Mantyke", number: 458, image: UIImage(named: "458"), generation: "Gen 4", type: .Water, type2: .Flying),
            Pokemon(name: "Snover", number: 459, image: UIImage(named: "459"), generation: "Gen 4", type: .Grass, type2: .Ice),
            Pokemon(name: "Abomasnow", number: 460, image: UIImage(named: "460"), generation: "Gen 4", type: .Grass, type2: .Ice),
            Pokemon(name: "Weavile", number: 461, image: UIImage(named: "461"), generation: "Gen 4", type: .Dark, type2: .Ice),
            Pokemon(name: "Magnezone", number: 462, image: UIImage(named: "462"), generation: "Gen 4", type: .Electric, type2: .Steel),
            Pokemon(name: "Lickilicky", number: 463, image: UIImage(named: "463"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Rhyperior", number: 464, image: UIImage(named: "464"), generation: "Gen 4", type: .Ground, type2: .Rock),
            Pokemon(name: "Tangrowth", number: 465, image: UIImage(named: "465"), generation: "Gen 4", type: .Grass, type2: nil),
            Pokemon(name: "Electivire", number: 466, image: UIImage(named: "466"), generation: "Gen 4", type: .Electric, type2: nil),
            Pokemon(name: "Magmortar", number: 467, image: UIImage(named: "467"), generation: "Gen 4", type: .Fairy, type2: .Flying),
            Pokemon(name: "Togekiss", number: 468, image: UIImage(named: "468"), generation: "Gen 4", type: .Fairy, type2: .Flying),
            Pokemon(name: "Yanmega", number: 469, image: UIImage(named: "469"), generation: "Gen 4", type: .Bug, type2: .Flying),
            Pokemon(name: "Leafeon", number: 470, image: UIImage(named: "470"), generation: "Gen 4", type: .Grass, type2: nil),
            Pokemon(name: "Glaceon", number: 471, image: UIImage(named: "471"), generation: "Gen 4", type: .Ice, type2: nil),
            Pokemon(name: "Gliscor", number: 472, image: UIImage(named: "472"), generation: "Gen 4", type: .Ground, type2: .Flying),
            Pokemon(name: "Mamoswine", number: 473, image: UIImage(named: "473"), generation: "Gen 4", type: .Ice, type2: .Ground),
            Pokemon(name: "Porygon-Z", number: 474, image: UIImage(named: "474"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Gallade", number: 475, image: UIImage(named: "475"), generation: "Gen 4", type: .Psychic, type2: .Fighting),
            Pokemon(name: "Probopass", number: 476, image: UIImage(named: "476"), generation: "Gen 4", type: .Rock, type2: .Steel),
            Pokemon(name: "Dusknoir", number: 477, image: UIImage(named: "477"), generation: "Gen 4", type: .Ghost, type2: nil),
            Pokemon(name: "Froslass", number: 478, image: UIImage(named: "478"), generation: "Gen 4", type: .Ice, type2: .Ghost),
            Pokemon(name: "Rotom", number: 479, image: UIImage(named: "479"), generation: "Gen 4", type: .Electric, type2: .Ghost),
            Pokemon(name: "Uxie", number: 480, image: UIImage(named: "480"), generation: "Gen 4", type: .Psychic, type2: nil),
            Pokemon(name: "Mesprit", number: 481, image: UIImage(named: "481"), generation: "Gen 4", type: .Psychic, type2: nil),
            Pokemon(name: "Azelf", number: 482, image: UIImage(named: "482"), generation: "Gen 4", type: .Psychic, type2: nil),
            Pokemon(name: "Dialga", number: 483, image: UIImage(named: "483"), generation: "Gen 4", type: .Steel, type2: .Dragon),
            Pokemon(name: "Palkia", number: 484, image: UIImage(named: "484"), generation: "Gen 4", type: .Water, type2: .Dragon),
            Pokemon(name: "Heatran", number: 485, image: UIImage(named: "485"), generation: "Gen 4", type: .Fire, type2: .Steel),
            Pokemon(name: "Regigigas", number: 486, image: UIImage(named: "486"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Giratina (Altered)", number: 487, image: UIImage(named: "487-altered"), generation: "Gen 4", type: .Ghost, type2: .Dragon),
            Pokemon(name: "Giratina (Origin)", number: 487, image: UIImage(named: "487-origin"), generation: "Gen 4", type: .Ghost, type2: .Dragon),
            Pokemon(name: "Cresselia", number: 488, image: UIImage(named: "488"), generation: "Gen 4", type: .Psychic, type2: nil),
            Pokemon(name: "Phione", number: 489, image: UIImage(named: "489"), generation: "Gen 4", type: .Water, type2: nil),
            Pokemon(name: "Manaphy", number: 490, image: UIImage(named: "490"), generation: "Gen 4", type: .Water, type2: nil),
            Pokemon(name: "Darkrai", number: 491, image: UIImage(named: "491"), generation: "Gen 4", type: .Dark, type2: nil),
            Pokemon(name: "Shaymin (Land)", number: 492, image: UIImage(named: "492-land"), generation: "Gen 4", type: .Grass, type2: nil),
            Pokemon(name: "Shaymin (Sky)", number: 492, image: UIImage(named: "492-sky"), generation: "Gen 4", type: .Grass, type2: .Flying),
            Pokemon(name: "Arceus", number: 493, image: UIImage(named: "493"), generation: "Gen 4", type: .Normal, type2: nil),
            Pokemon(name: "Victini", number: 494, image: UIImage(named: "494"), generation: "Gen 4", type: .Psychic, type2: .Fire),
    
            // MARK: Gen 5 ////////////////////////////////////////////////////////////////////////////////////////////////////////

            Pokemon(name: "Snivy", number: 495, image: UIImage(named: "495"), generation: "Gen 5", type: .Grass, type2: nil),
            Pokemon(name: "Servine", number: 496, image: UIImage(named: "496"), generation: "Gen 5", type: .Grass, type2: nil),
            Pokemon(name: "Serperior", number: 497, image: UIImage(named: "497"), generation: "Gen 5", type: .Grass, type2: nil),
            Pokemon(name: "Tepig", number: 498, image: UIImage(named: "498"), generation: "Gen 5", type: .Fire, type2: nil),
            Pokemon(name: "Pignite", number: 499, image: UIImage(named: "499"), generation: "Gen 5", type: .Fire, type2: .Fighting),
            Pokemon(name: "Emboar", number: 500, image: UIImage(named: "500"), generation: "Gen 5", type: .Fire, type2: .Fighting),
            Pokemon(name: "Oshawott", number: 501, image: UIImage(named: "501"), generation: "Gen 5", type: .Water, type2: nil),
            Pokemon(name: "Dewott", number: 502, image: UIImage(named: "502"), generation: "Gen 5", type: .Water, type2: nil),
            Pokemon(name: "Samurott", number: 503, image: UIImage(named: "503"), generation: "Gen 5", type: .Water, type2: nil),
            Pokemon(name: "Patrat", number: 504, image: UIImage(named: "504"), generation: "Gen 5", type: .Normal, type2: nil),
            Pokemon(name: "Watchog", number: 505, image: UIImage(named: "505"), generation: "Gen 5", type: .Normal, type2: nil),
            Pokemon(name: "Lillipup", number: 506, image: UIImage(named: "506"), generation: "Gen 5", type: .Normal, type2: nil),
            Pokemon(name: "Herdier", number: 507, image: UIImage(named: "507"), generation: "Gen 5", type: .Normal, type2: nil),
            Pokemon(name: "Stoutland", number: 508, image: UIImage(named: "508"), generation: "Gen 5", type: .Normal, type2: nil),
            Pokemon(name: "Purrloin", number: 509, image: UIImage(named: "509"), generation: "Gen 5", type: .Dark, type2: nil),
            Pokemon(name: "Liepard", number: 510, image: UIImage(named: "510"), generation: "Gen 5", type: .Dark, type2: nil),
            Pokemon(name: "Pansage", number: 511, image: UIImage(named: "511"), generation: "Gen 5", type: .Grass, type2: nil),
            Pokemon(name: "Simisage", number: 512, image: UIImage(named: "512"), generation: "Gen 5", type: .Grass, type2: nil),
            Pokemon(name: "Pansear", number: 513, image: UIImage(named: "513"), generation: "Gen 5", type: .Fire, type2: nil),
            Pokemon(name: "Simisear", number: 514, image: UIImage(named: "514"), generation: "Gen 5", type: .Fire, type2: nil),
            Pokemon(name: "Panpour", number: 515, image: UIImage(named: "515"), generation: "Gen 5", type: .Water, type2: nil),
            Pokemon(name: "Simipour", number: 516, image: UIImage(named: "516"), generation: "Gen 5", type: .Water, type2: nil),
            Pokemon(name: "Munna", number: 517, image: UIImage(named: "517"), generation: "Gen 5", type: .Psychic, type2: nil),
            Pokemon(name: "Musharna", number: 518, image: UIImage(named: "518"), generation: "Gen 5", type: .Psychic, type2: nil),
            Pokemon(name: "Pidove", number: 519, image: UIImage(named: "519"), generation: "Gen 5", type: .Normal, type2: .Flying),
            Pokemon(name: "Tranquill", number: 520, image: UIImage(named: "520"), generation: "Gen 5", type: .Normal, type2: .Flying),
            Pokemon(name: "Unfezant", number: 521, image: UIImage(named: "521"), generation: "Gen 5", type: .Normal, type2: .Flying),
            Pokemon(name: "Blitzle", number: 522, image: UIImage(named: "522"), generation: "Gen 5", type: .Electric, type2: nil),
            Pokemon(name: "Zebstika", number: 523, image: UIImage(named: "523"), generation: "Gen 5", type: .Electric, type2: nil),
            Pokemon(name: "Roggenrola", number: 524, image: UIImage(named: "524"), generation: "Gen 5", type: .Rock, type2: nil),
            Pokemon(name: "Boldore", number: 525, image: UIImage(named: "525"), generation: "Gen 5", type: .Rock, type2: nil),
            Pokemon(name: "Gigalith", number: 526, image: UIImage(named: "526"), generation: "Gen 5", type: .Rock, type2: nil),
            Pokemon(name: "Woobat", number: 527, image: UIImage(named: "527"), generation: "Gen 5", type: .Psychic, type2: .Flying),
            Pokemon(name: "Swoobat", number: 528, image: UIImage(named: "528"), generation: "Gen 5", type: .Psychic, type2: .Flying),
            Pokemon(name: "Drilbur", number: 529, image: UIImage(named: "529"), generation: "Gen 5", type: .Ground, type2: nil),
            Pokemon(name: "Excadrill", number: 530, image: UIImage(named: "530"), generation: "Gen 5", type: .Ground, type2: .Steel),
            Pokemon(name: "Audino", number: 531, image: UIImage(named: "531"), generation: "Gen 5", type: .Normal, type2: nil),
            Pokemon(name: "Timburr", number: 532, image: UIImage(named: "532"), generation: "Gen 5", type: .Fighting, type2: nil),
            Pokemon(name: "Gurdurr", number: 533, image: UIImage(named: "533"), generation: "Gen 5", type: .Fighting, type2: nil),
            Pokemon(name: "Conkeldurr", number: 534, image: UIImage(named: "534"), generation: "Gen 5", type: .Fighting, type2: nil),
            Pokemon(name: "Tympole", number: 535, image: UIImage(named: "535"), generation: "Gen 5", type: .Water, type2: nil),
            Pokemon(name: "Palpitoad", number: 536, image: UIImage(named: "536"), generation: "Gen 5", type: .Water, type2: .Ground),
            Pokemon(name: "Seismitoad", number: 537, image: UIImage(named: "537"), generation: "Gen 5", type: .Water, type2: .Ground),
            Pokemon(name: "Throh", number: 538, image: UIImage(named: "538"), generation: "Gen 5", type: .Fighting, type2: nil),
            Pokemon(name: "Sawk", number: 539, image: UIImage(named: "539"), generation: "Gen 5", type: .Fighting, type2: nil),
            Pokemon(name: "Sewaddle", number: 540, image: UIImage(named: "540"), generation: "Gen 5", type: .Bug, type2: .Grass),
            Pokemon(name: "Swadloon", number: 541, image: UIImage(named: "541"), generation: "Gen 5", type: .Bug, type2: .Grass),
            Pokemon(name: "Leavanny", number: 542, image: UIImage(named: "542"), generation: "Gen 5", type: .Bug, type2: .Grass),
            Pokemon(name: "Venipede", number: 543, image: UIImage(named: "543"), generation: "Gen 5", type: .Bug, type2: .Poison),
            Pokemon(name: "Whirlipede", number: 544, image: UIImage(named: "544"), generation: "Gen 5", type: .Bug, type2: .Poison),
            Pokemon(name: "Scolipede", number: 545, image: UIImage(named: "545"), generation: "Gen 5", type: .Bug, type2: .Poison),
            Pokemon(name: "Cottonee", number: 546, image: UIImage(named: "546"), generation: "Gen 5", type: .Grass, type2: .Fairy),
            Pokemon(name: "Whimsicott", number: 547, image: UIImage(named: "547"), generation: "Gen 5", type: .Grass, type2: .Fairy),
            Pokemon(name: "Petilil", number: 548, image: UIImage(named: "548"), generation: "Gen 5", type: .Grass, type2: nil),
            Pokemon(name: "Lillgant", number: 549, image: UIImage(named: "549"), generation: "Gen 5", type: .Grass, type2: nil),
            Pokemon(name: "Basulin", number: 550, image: UIImage(named: "550"), generation: "Gen 5", type: .Water, type2: nil),
            Pokemon(name: "Sandile", number: 551, image: UIImage(named: "551"), generation: "Gen 5", type: .Ground, type2: .Dark),
            Pokemon(name: "Krokorok", number: 552, image: UIImage(named: "552"), generation: "Gen 5", type: .Ground, type2: .Dark),
            Pokemon(name: "Krookodile", number: 553, image: UIImage(named: "553"), generation: "Gen 5", type: .Ground, type2: .Dark),
            Pokemon(name: "Darumaka", number: 554, image: UIImage(named: "554"), generation: "Gen 5", type: .Fire, type2: nil),
            Pokemon(name: "Darmanitan (Standard)", number: 555, image: UIImage(named: "555-standard"), generation: "Gen 5", type: .Fire, type2: nil),
            Pokemon(name: "Darmanitan (Zen)", number: 555, image: UIImage(named: "555-zen"), generation: "Gen 5", type: .Fire, type2: .Psychic),
            Pokemon(name: "Maractus", number: 556, image: UIImage(named: "556"), generation: "Gen 5", type: .Grass, type2: nil),
            Pokemon(name: "Dwebble", number: 557, image: UIImage(named: "557"), generation: "Gen 5", type: .Bug, type2: .Rock),
            Pokemon(name: "Crustle", number: 558, image: UIImage(named: "558"), generation: "Gen 5", type: .Bug, type2: .Rock),
            Pokemon(name: "Scraggy", number: 559, image: UIImage(named: "559"), generation: "Gen 5", type: .Dark, type2: .Fighting),
            Pokemon(name: "Scrafty", number: 560, image: UIImage(named: "560"), generation: "Gen 5", type: .Dark, type2: .Fighting),
            Pokemon(name: "Sigilyph", number: 561, image: UIImage(named: "561"), generation: "Gen 5", type: .Psychic, type2: .Flying),
            Pokemon(name: "Yamask", number: 562, image: UIImage(named: "562"), generation: "Gen 5", type: .Ghost, type2: nil),
            Pokemon(name: "Cofagrigus", number: 563, image: UIImage(named: "563"), generation: "Gen 5", type: .Ghost, type2: nil),
            Pokemon(name: "Tirtouga", number: 564, image: UIImage(named: "564"), generation: "Gen 5", type: .Water, type2: .Rock),
            Pokemon(name: "Carracosta", number: 565, image: UIImage(named: "565"), generation: "Gen 5", type: .Water, type2: .Rock),
            Pokemon(name: "Archen", number: 566, image: UIImage(named: "566"), generation: "Gen 5", type: .Rock, type2: .Flying),
            Pokemon(name: "Archeops", number: 567, image: UIImage(named: "567"), generation: "Gen 5", type: .Rock, type2: .Flying),
            Pokemon(name: "Trubbish", number: 568, image: UIImage(named: "568"), generation: "Gen 5", type: .Poison, type2: nil),
            Pokemon(name: "Garbodor", number: 569, image: UIImage(named: "569"), generation: "Gen 5", type: .Poison, type2: nil),
            Pokemon(name: "Zorua", number: 570, image: UIImage(named: "570"), generation: "Gen 5", type: .Dark, type2: nil),
            Pokemon(name: "Zoroark", number: 571, image: UIImage(named: "571"), generation: "Gen 5", type: .Dark, type2: nil),
            Pokemon(name: "Minccino", number: 572, image: UIImage(named: "572"), generation: "Gen 5", type: .Normal, type2: nil),
            Pokemon(name: "Cinccino", number: 573, image: UIImage(named: "573"), generation: "Gen 5", type: .Normal, type2: nil),
            Pokemon(name: "Gothita", number: 574, image: UIImage(named: "574"), generation: "Gen 5", type: .Psychic, type2: nil),
            Pokemon(name: "Gothorita", number: 575, image: UIImage(named: "575"), generation: "Gen 5", type: .Psychic, type2: nil),
            Pokemon(name: "Gothitelle", number: 576, image: UIImage(named: "576"), generation: "Gen 5", type: .Psychic, type2: nil),
            Pokemon(name: "Solosis", number: 577, image: UIImage(named: "577"), generation: "Gen 5", type: .Psychic, type2: nil),
            Pokemon(name: "Duosion", number: 578, image: UIImage(named: "578"), generation: "Gen 5", type: .Psychic, type2: nil),
            Pokemon(name: "Reuniclus", number: 579, image: UIImage(named: "579"), generation: "Gen 5", type: .Psychic, type2: nil),
            Pokemon(name: "Ducklett", number: 580, image: UIImage(named: "580"), generation: "Gen 5", type: .Water, type2: .Flying),
            Pokemon(name: "Swanna", number: 581, image: UIImage(named: "581"), generation: "Gen 5", type: .Water, type2: .Flying),
            Pokemon(name: "Vanilite", number: 582, image: UIImage(named: "582"), generation: "Gen 5", type: .Ice, type2: nil),
            Pokemon(name: "Vanillish", number: 583, image: UIImage(named: "583"), generation: "Gen 5", type: .Ice, type2: nil),
            Pokemon(name: "Vinilluxe", number: 584, image: UIImage(named: "584"), generation: "Gen 5", type: .Ice, type2: nil),
            Pokemon(name: "Deering", number: 585, image: UIImage(named: "585"), generation: "Gen 5", type: .Normal, type2: .Grass),
            Pokemon(name: "Sawsbuck", number: 586, image: UIImage(named: "586"), generation: "Gen 5", type: .Normal, type2: .Grass),
            Pokemon(name: "Emolga", number: 587, image: UIImage(named: "587"), generation: "Gen 5", type: .Electric, type2: .Flying),
            Pokemon(name: "Karrablast", number: 588, image: UIImage(named: "588"), generation: "Gen 5", type: .Bug, type2: nil),
            Pokemon(name: "Escavalier", number: 589, image: UIImage(named: "589"), generation: "Gen 5", type: .Bug, type2: .Steel),
            Pokemon(name: "Foongus", number: 590, image: UIImage(named: "590"), generation: "Gen 5", type: .Grass, type2: .Poison),
            Pokemon(name: "Amoonuss", number: 591, image: UIImage(named: "591"), generation: "Gen 5", type: .Grass, type2: .Poison),
            Pokemon(name: "Frillish", number: 592, image: UIImage(named: "592"), generation: "Gen 5", type: .Water, type2: .Ghost),
            Pokemon(name: "Jellicent", number: 593, image: UIImage(named: "593"), generation: "Gen 5", type: .Water, type2: .Ghost),
            Pokemon(name: "Alomomola", number: 594, image: UIImage(named: "594"), generation: "Gen 5", type: .Water, type2: nil),
            Pokemon(name: "Joltik", number: 595, image: UIImage(named: "595"), generation: "Gen 5", type: .Bug, type2: .Electric),
            Pokemon(name: "Galvantula", number: 596, image: UIImage(named: "596"), generation: "Gen 5", type: .Bug, type2: .Electric),
            Pokemon(name: "Ferroeed", number: 597, image: UIImage(named: "597"), generation: "Gen 5", type: .Grass, type2: .Steel),
            Pokemon(name: "Ferrothorn", number: 598, image: UIImage(named: "598"), generation: "Gen 5", type: .Grass, type2: .Steel),
            Pokemon(name: "Klink", number: 599, image: UIImage(named: "599"), generation: "Gen 5", type: .Steel, type2: nil),
            Pokemon(name: "Klang", number: 600, image: UIImage(named: "600"), generation: "Gen 5", type: .Steel, type2: nil),
            Pokemon(name: "Klinklang", number: 601, image: UIImage(named: "601"), generation: "Gen 5", type: .Steel, type2: nil),
            Pokemon(name: "Tynamo", number: 602, image: UIImage(named: "602"), generation: "Gen 5", type: .Electric, type2: nil),
            Pokemon(name: "Eelektrik", number: 603, image: UIImage(named: "603"), generation: "Gen 5", type: .Electric, type2: nil),
            Pokemon(name: "Eelektross", number: 604, image: UIImage(named: "604"), generation: "Gen 5", type: .Electric, type2: nil),
            Pokemon(name: "Elgyem", number: 605, image: UIImage(named: "605"), generation: "Gen 5", type: .Psychic, type2: nil),
            Pokemon(name: "Beheeyem", number: 606, image: UIImage(named: "606"), generation: "Gen 5", type: .Psychic, type2: nil),
            Pokemon(name: "Litwick", number: 607, image: UIImage(named: "607"), generation: "Gen 5", type: .Ghost, type2: .Fire),
            Pokemon(name: "Lampent", number: 608, image: UIImage(named: "608"), generation: "Gen 5", type: .Ghost, type2: .Fire),
            Pokemon(name: "Chandelure", number: 609, image: UIImage(named: "609"), generation: "Gen 5", type: .Ghost, type2: .Fire),
            Pokemon(name: "Axew", number: 610, image: UIImage(named: "610"), generation: "Gen 5", type: .Dragon, type2: nil),
            Pokemon(name: "Fraxure", number: 611, image: UIImage(named: "611"), generation: "Gen 5", type: .Dragon, type2: nil),
            Pokemon(name: "Haxorus", number: 612, image: UIImage(named: "612"), generation: "Gen 5", type: .Dragon, type2: nil),
            Pokemon(name: "Cubchoo", number: 613, image: UIImage(named: "613"), generation: "Gen 5", type: .Ice, type2: nil),
            Pokemon(name: "Beartic", number: 614, image: UIImage(named: "614"), generation: "Gen 5", type: .Ice, type2: nil),
            Pokemon(name: "Cryogonal", number: 615, image: UIImage(named: "615"), generation: "Gen 5", type: .Ice, type2: nil),
            Pokemon(name: "Shelmet", number: 616, image: UIImage(named: "616"), generation: "Gen 5", type: .Bug, type2: nil),
            Pokemon(name: "Accelgor", number: 617, image: UIImage(named: "617"), generation: "Gen 5", type: .Bug, type2: nil),
            Pokemon(name: "Stunfisk", number: 618, image: UIImage(named: "618"), generation: "Gen 5", type: .Ground, type2: .Electric),
            Pokemon(name: "Mienfoo", number: 619, image: UIImage(named: "619"), generation: "Gen 5", type: .Fighting, type2: nil),
            Pokemon(name: "Mienshao", number: 620, image: UIImage(named: "620"), generation: "Gen 5", type: .Fighting, type2: nil),
            Pokemon(name: "Druddgon", number: 621, image: UIImage(named: "621"), generation: "Gen 5", type: .Dragon, type2: nil),
            Pokemon(name: "Golett", number: 622, image: UIImage(named: "622"), generation: "Gen 5", type: .Ground, type2: .Ghost),
            Pokemon(name: "Golurk", number: 623, image: UIImage(named: "623"), generation: "Gen 5", type: .Ground, type2: .Ghost),
            Pokemon(name: "Pawniard", number: 624, image: UIImage(named: "624"), generation: "Gen 5", type: .Dark, type2: .Steel),
            Pokemon(name: "Bisharp", number: 625, image: UIImage(named: "625"), generation: "Gen 5", type: .Dark, type2: .Steel),
            Pokemon(name: "Bouffalant", number: 626, image: UIImage(named: "626"), generation: "Gen 5", type: .Normal, type2: nil),
            Pokemon(name: "Rufflet", number: 627, image: UIImage(named: "627"), generation: "Gen 5", type: .Normal, type2: .Flying),
            Pokemon(name: "Braviary", number: 628, image: UIImage(named: "628"), generation: "Gen 5", type: .Normal, type2: .Flying),
            Pokemon(name: "Vullby", number: 629, image: UIImage(named: "629"), generation: "Gen 5", type: .Dark, type2: .Flying),
            Pokemon(name: "Mandibuzz", number: 630, image: UIImage(named: "630"), generation: "Gen 5", type: .Dark, type2: .Flying),
            Pokemon(name: "Heatmor", number: 631, image: UIImage(named: "631"), generation: "Gen 5", type: .Fire, type2: nil),
            Pokemon(name: "Durant", number: 632, image: UIImage(named: "632"), generation: "Gen 5", type: .Bug, type2: .Steel),
            Pokemon(name: "Deino", number: 633, image: UIImage(named: "633"), generation: "Gen 5", type: .Dark, type2: .Dragon),
            Pokemon(name: "Zweilous", number: 634, image: UIImage(named: "634"), generation: "Gen 5", type: .Dark, type2: .Dragon),
            Pokemon(name: "Hydreigon", number: 635, image: UIImage(named: "635"), generation: "Gen 5", type: .Dark, type2: .Dragon),
            Pokemon(name: "Larvesta", number: 636, image: UIImage(named: "636"), generation: "Gen 5", type: .Bug, type2: .Fire),
            Pokemon(name: "Volcarona", number: 637, image: UIImage(named: "637"), generation: "Gen 5", type: .Bug, type2: .Fire),
            Pokemon(name: "Coblion", number: 638, image: UIImage(named: "638"), generation: "Gen 5", type: .Steel, type2: .Fighting),
            Pokemon(name: "Terrakion", number: 639, image: UIImage(named: "639"), generation: "Gen 5", type: .Rock, type2: .Fighting),
            Pokemon(name: "Virizion", number: 640, image: UIImage(named: "640"), generation: "Gen 5", type: .Grass, type2: .Fighting),
            Pokemon(name: "Tornadus (Incarnate)", number: 641, image: UIImage(named: "641"), generation: "Gen 5", type: .Flying, type2: nil),
            Pokemon(name: "Tornadus (Therian)", number: 641, image: UIImage(named: "641-therian"), generation: "Gen 5", type: .Flying, type2: nil),
            Pokemon(name: "Thundurus (Incarnate)", number: 642, image: UIImage(named: "642"), generation: "Gen 5", type: .Electric, type2: .Flying),
            Pokemon(name: "Thundurus (Therian)", number: 642, image: UIImage(named: "642-therian"), generation: "Gen 5", type: .Electric, type2: .Flying),
            Pokemon(name: "Reshiram", number: 643, image: UIImage(named: "643"), generation: "Gen 5", type: .Dragon, type2: .Fire),
            Pokemon(name: "Zekrom", number: 644, image: UIImage(named: "644"), generation: "Gen 5", type: .Dragon, type2: .Electric),
            Pokemon(name: "Landorus (Incarnate)", number: 645, image: UIImage(named: "645"), generation: "Gen 5", type: .Ground, type2: .Flying),
            Pokemon(name: "Landorus (Therian)", number: 645, image: UIImage(named: "645-therian"), generation: "Gen 5", type: .Ground, type2: .Flying),
            Pokemon(name: "Kyurem", number: 646, image: UIImage(named: "646"), generation: "Gen 5", type: .Dragon, type2: .Ice),
            Pokemon(name: "Kyurem (Black)", number: 646, image: UIImage(named: "646-black"), generation: "Gen 5", type: .Dragon, type2: .Ice),
            Pokemon(name: "Kyurem (White)", number: 646, image: UIImage(named: "646-white"), generation: "Gen 5", type: .Dragon, type2: .Ice),
            Pokemon(name: "Keldeo", number: 647, image: UIImage(named: "647"), generation: "Gen 5", type: .Water, type2: .Fighting),
            Pokemon(name: "Melotta (Aria)", number: 648, image: UIImage(named: "648-aria"), generation: "Gen 5", type: .Normal, type2: .Psychic),
            Pokemon(name: "Melotta (Pirouette)", number: 648, image: UIImage(named: "648-pirouette"), generation: "Gen 5", type: .Normal, type2: .Fighting),
            Pokemon(name: "Genesect", number: 649, image: UIImage(named: "649"), generation: "Gen 5", type: .Bug, type2: .Steel),
         
            
            // MARK: Gen 6 ////////////////////////////////////////////////////////////////////////////////////////////////////////
            
            
            Pokemon(name: "Chespin", number: 650, image: UIImage(named: "650"), generation: "Gen 6", type: .Grass, type2: nil),
            Pokemon(name: "Quilladin", number: 651, image: UIImage(named: "651"), generation: "Gen 6", type: .Grass, type2: nil),
            Pokemon(name: "Chesnaught", number: 652, image: UIImage(named: "652"), generation: "Gen 6", type: .Grass, type2: .Fighting),
            Pokemon(name: "Fennekin", number: 653, image: UIImage(named: "653"), generation: "Gen 6", type: .Fire, type2: nil),
            Pokemon(name: "Braixen", number: 654, image: UIImage(named: "654"), generation: "Gen 6", type: .Fire, type2: nil),
            Pokemon(name: "Delphox", number: 655, image: UIImage(named: "655"), generation: "Gen 6", type: .Fire, type2: .Psychic),
            Pokemon(name: "Froakie", number: 656, image: UIImage(named: "656"), generation: "Gen 6", type: .Water, type2: nil),
            Pokemon(name: "Frogadier", number: 657, image: UIImage(named: "657"), generation: "Gen 6", type: .Water, type2: nil),
            Pokemon(name: "Greninja", number: 658, image: UIImage(named: "658"), generation: "Gen 6", type: .Water, type2: .Dark),
            Pokemon(name: "Bunnelby", number: 659, image: UIImage(named: "659"), generation: "Gen 6", type: .Normal, type2: nil),
            Pokemon(name: "Diggersby", number: 660, image: UIImage(named: "660"), generation: "Gen 6", type: .Normal, type2: .Ground),
            Pokemon(name: "Fletchling", number: 661, image: UIImage(named: "661"), generation: "Gen 6", type: .Normal, type2: .Flying),
            Pokemon(name: "Fletchinder", number: 662, image: UIImage(named: "662"), generation: "Gen 6", type: .Fire, type2: .Flying),
            Pokemon(name: "Talonflame", number: 663, image: UIImage(named: "663"), generation: "Gen 6", type: .Fire, type2: .Flying),
            Pokemon(name: "Scatterbug", number: 664, image: UIImage(named: "664"), generation: "Gen 6", type: .Bug, type2: nil),
            Pokemon(name: "Spewpa", number: 665, image: UIImage(named: "665"), generation: "Gen 6", type: .Bug, type2: nil),
            Pokemon(name: "Vivillon", number: 666, image: UIImage(named: "666"), generation: "Gen 6", type: .Bug, type2: .Flying),
            Pokemon(name: "Litleo", number: 667, image: UIImage(named: "667"), generation: "Gen 6", type: .Fire, type2: .Normal),
            Pokemon(name: "Pyroar", number: 668, image: UIImage(named: "668"), generation: "Gen 6", type: .Fire, type2: .Normal),
            Pokemon(name: "Flabébé", number: 669, image: UIImage(named: "669"), generation: "Gen 6", type: .Fairy, type2: nil),
            Pokemon(name: "Floette", number: 670, image: UIImage(named: "670"), generation: "Gen 6", type: .Fairy, type2: nil),
            Pokemon(name: "Florges", number: 671, image: UIImage(named: "671"), generation: "Gen 6", type: .Fairy, type2: nil),
            Pokemon(name: "Skiddo", number: 672, image: UIImage(named: "672"), generation: "Gen 6", type: .Grass, type2: nil),
            Pokemon(name: "Gogoat", number: 673, image: UIImage(named: "673"), generation: "Gen 6", type: .Grass, type2: nil),
            Pokemon(name: "Pancham", number: 674, image: UIImage(named: "674"), generation: "Gen 6", type: .Fighting, type2: nil),
            Pokemon(name: "Pangoro", number: 675, image: UIImage(named: "675"), generation: "Gen 6", type: .Fighting, type2: .Dark),
            Pokemon(name: "Furfrou", number: 676, image: UIImage(named: "676"), generation: "Gen 6", type: .Normal, type2: nil),
            Pokemon(name: "Espurr", number: 677, image: UIImage(named: "677"), generation: "Gen 6", type: .Psychic, type2: nil),
            Pokemon(name: "Meowstic", number: 678, image: UIImage(named: "678"), generation: "Gen 6", type: .Psychic, type2: nil),
            Pokemon(name: "Honedge", number: 679, image: UIImage(named: "679"), generation: "Gen 6", type: .Steel, type2: .Ghost),
            Pokemon(name: "Doublade", number: 680, image: UIImage(named: "680"), generation: "Gen 6", type: .Steel, type2: .Ghost),
            Pokemon(name: "Aegislash", number: 681, image: UIImage(named: "681"), generation: "Gen 6", type: .Steel, type2: .Ghost),
            Pokemon(name: "Spiritzee", number: 682, image: UIImage(named: "682"), generation: "Gen 6", type: .Fairy, type2: nil),
            Pokemon(name: "Aromatisse", number: 683, image: UIImage(named: "683"), generation: "Gen 6", type: .Fairy, type2: nil),
            Pokemon(name: "Swirlix", number: 684, image: UIImage(named: "684"), generation: "Gen 6", type: .Fairy, type2: nil),
            Pokemon(name: "Slurpuff", number: 685, image: UIImage(named: "685"), generation: "Gen 6", type: .Fairy, type2: nil),
            Pokemon(name: "Inkay", number: 686, image: UIImage(named: "686"), generation: "Gen 6", type: .Dark, type2: .Psychic),
            Pokemon(name: "Malamar", number: 687, image: UIImage(named: "687"), generation: "Gen 6", type: .Dark, type2: .Psychic),
            Pokemon(name: "Binacle", number: 688, image: UIImage(named: "688"), generation: "Gen 6", type: .Rock, type2: .Water),
            Pokemon(name: "Barbarcle", number: 689, image: UIImage(named: "689"), generation: "Gen 6", type: .Rock, type2: .Water),
            Pokemon(name: "Skrelp", number: 690, image: UIImage(named: "690"), generation: "Gen 6", type: .Poison, type2: .Water),
            Pokemon(name: "Dragalge", number: 691, image: UIImage(named: "691"), generation: "Gen 6", type: .Poison, type2: .Dragon),
            Pokemon(name: "Clauncher", number: 692, image: UIImage(named: "692"), generation: "Gen 6", type: .Water, type2: nil),
            Pokemon(name: "Clawitzer", number: 693, image: UIImage(named: "693"), generation: "Gen 6", type: .Water, type2: nil),
            Pokemon(name: "Helioptile", number: 694, image: UIImage(named: "694"), generation: "Gen 6", type: .Electric, type2: .Normal),
            Pokemon(name: "Heliolisk", number: 695, image: UIImage(named: "695"), generation: "Gen 6", type: .Electric, type2: .Normal),
            Pokemon(name: "Tyrunt", number: 696, image: UIImage(named: "696"), generation: "Gen 6", type: .Rock, type2: .Dragon),
            Pokemon(name: "Tyrantrum", number: 697, image: UIImage(named: "697"), generation: "Gen 6", type: .Rock, type2: .Dragon),
            Pokemon(name: "Amaura", number: 698, image: UIImage(named: "698"), generation: "Gen 6", type: .Rock, type2: .Ice),
            Pokemon(name: "Aurorus", number: 699, image: UIImage(named: "699"), generation: "Gen 6", type: .Rock, type2: .Ice),
            Pokemon(name: "Sylveon", number: 700, image: UIImage(named: "700"), generation: "Gen 6", type: .Fairy, type2: nil),
            Pokemon(name: "Hawlucha", number: 701, image: UIImage(named: "701"), generation: "Gen 6", type: .Fighting, type2: .Flying),
            Pokemon(name: "Dedenne", number: 702, image: UIImage(named: "702"), generation: "Gen 6", type: .Electric, type2: .Fairy),
            Pokemon(name: "Carbink", number: 703, image: UIImage(named: "703"), generation: "Gen 6", type: .Rock, type2: .Fairy),
            Pokemon(name: "Goomy", number: 704, image: UIImage(named: "704"), generation: "Gen 6", type: .Dragon, type2: nil),
            Pokemon(name: "Sliggoo", number: 705, image: UIImage(named: "705"), generation: "Gen 6", type: .Dragon, type2: nil),
            Pokemon(name: "Goodra", number: 706, image: UIImage(named: "706"), generation: "Gen 6", type: .Dragon, type2: nil),
            Pokemon(name: "Klefki", number: 707, image: UIImage(named: "707"), generation: "Gen 6", type: .Steel, type2: .Fairy),
            Pokemon(name: "Phantump", number: 708, image: UIImage(named: "708"), generation: "Gen 6", type: .Ghost, type2: .Grass),
            Pokemon(name: "Trevenant", number: 709, image: UIImage(named: "709"), generation: "Gen 6", type: .Ghost, type2: .Grass),
            Pokemon(name: "Pumpkaboo", number: 710, image: UIImage(named: "710"), generation: "Gen 6", type: .Ghost, type2: .Grass),
            Pokemon(name: "Gourgeist", number: 711, image: UIImage(named: "711"), generation: "Gen 6", type: .Ghost, type2: .Grass),
            Pokemon(name: "Bergmite", number: 712, image: UIImage(named: "712"), generation: "Gen 6", type: .Ice, type2: nil),
            Pokemon(name: "Avalugg", number: 713, image: UIImage(named: "713"), generation: "Gen 6", type: .Ice, type2: nil),
            Pokemon(name: "Noibat", number: 714, image: UIImage(named: "714"), generation: "Gen 6", type: .Flying, type2: .Dragon),
            Pokemon(name: "Noivern", number: 715, image: UIImage(named: "715"), generation: "Gen 6", type: .Flying, type2: .Dragon),
            Pokemon(name: "Xerneas", number: 716, image: UIImage(named: "716"), generation: "Gen 6", type: .Fairy, type2: nil),
            Pokemon(name: "Yveltal", number: 717, image: UIImage(named: "717"), generation: "Gen 6", type: .Dark, type2: .Flying),
            Pokemon(name: "Zygarde", number: 718, image: UIImage(named: "718"), generation: "Gen 6", type: .Dragon, type2: .Ground),
            Pokemon(name: "Diancie", number: 719, image: UIImage(named: "719"), generation: "Gen 6", type: .Rock, type2: .Fairy),
            Pokemon(name: "Hoopa", number: 720, image: UIImage(named: "720"), generation: "Gen 6", type: .Psychic, type2: .Ghost),
            Pokemon(name: "Volcanion", number: 721, image: UIImage(named: "721"), generation: "Gen 6", type: .Fire, type2: .Water),
        

            // MARK: Gen 7 ////////////////////////////////////////////////////////////////////////////////////////////////////////
            
            
            Pokemon(name: "Rowlet", number: 722, image: UIImage(named: "722"), generation: "Gen 7", type: .Grass, type2: .Flying),
            Pokemon(name: "Dartrix", number: 723, image: UIImage(named: "723"), generation: "Gen 7", type: .Grass, type2: .Flying),
            Pokemon(name: "Decidueye", number: 724, image: UIImage(named: "724"), generation: "Gen 7", type: .Grass, type2: .Ghost),
            Pokemon(name: "Litten", number: 725, image: UIImage(named: "725"), generation: "Gen 7", type: .Fire, type2: nil),
            Pokemon(name: "Torracat", number: 726, image: UIImage(named: "726"), generation: "Gen 7", type: .Fire, type2: nil),
            Pokemon(name: "Incineroar", number: 727, image: UIImage(named: "727"), generation: "Gen 7", type: .Fire, type2: .Dark),
            Pokemon(name: "Popplio", number: 728, image: UIImage(named: "728"), generation: "Gen 7", type: .Water, type2: nil),
            Pokemon(name: "Brionne", number: 729, image: UIImage(named: "729"), generation: "Gen 7", type: .Water, type2: nil),
            Pokemon(name: "Primarina", number: 730, image: UIImage(named: "730"), generation: "Gen 7", type: .Water, type2: .Fairy),
            Pokemon(name: "Pikipek", number: 731, image: UIImage(named: "731"), generation: "Gen 7", type: .Normal, type2: .Flying),
            Pokemon(name: "Trumbeak", number: 732, image: UIImage(named: "732"), generation: "Gen 7", type: .Normal, type2: .Flying),
            Pokemon(name: "Toucannon", number: 733, image: UIImage(named: "733"), generation: "Gen 7", type: .Normal, type2: .Flying),
            Pokemon(name: "Yungoos", number: 734, image: UIImage(named: "734"), generation: "Gen 7", type: .Normal, type2: nil),
            Pokemon(name: "Gumshoos", number: 735, image: UIImage(named: "735"), generation: "Gen 7", type: .Normal, type2: nil),
            Pokemon(name: "Grubbin", number: 736, image: UIImage(named: "736"), generation: "Gen 7", type: .Bug, type2: nil),
            Pokemon(name: "Charjabug", number: 737, image: UIImage(named: "737"), generation: "Gen 7", type: .Bug, type2: .Electric),
            Pokemon(name: "Vikavolt", number: 738, image: UIImage(named: "738"), generation: "Gen 7", type: .Bug, type2: .Electric),
            Pokemon(name: "Crabrawler", number: 739, image: UIImage(named: "739"), generation: "Gen 7", type: .Fighting, type2: nil),
            Pokemon(name: "Crabominable", number: 740, image: UIImage(named: "740"), generation: "Gen 7", type: .Fighting, type2: .Ice),
            Pokemon(name: "Oricorio", number: 741, image: UIImage(named: "741"), generation: "Gen 7", type: .Fire, type2: .Flying),
            //Pokemon(name: "Oricorio (Pom Pom)", number: 741, image: UIImage(named: "741_1"), generation: "Gen 7", type: .Electric, type2: .Flying),
            Pokemon(name: "Cutiefly", number: 742, image: UIImage(named: "742"), generation: "Gen 7", type: .Bug, type2: .Fairy),
            Pokemon(name: "Ribombee", number: 743, image: UIImage(named: "743"), generation: "Gen 7", type: .Bug, type2: .Fairy),
            Pokemon(name: "Rockruff", number: 744, image: UIImage(named: "744"), generation: "Gen 7", type: .Rock, type2: nil),
            Pokemon(name: "Lycanroc", number: 745, image: UIImage(named: "745"), generation: "Gen 7", type: .Rock, type2: nil),
            //Pokemon(name: "Lycanroc (Midnight)", number: 745, image: UIImage(named: "745_1"), generation: "Gen 7", type: .Rock, type2: nil),
            Pokemon(name: "Wishiwashi", number: 746, image: UIImage(named: "746"), generation: "Gen 7", type: .Water, type2: nil),
            //Pokemon(name: "Wishiwashi (School)", number: 746, image: UIImage(named: "746_1"), generation: "Gen 7", type: .Water, type2: nil),
            Pokemon(name: "Mareanie", number: 747, image: UIImage(named: "747"), generation: "Gen 7", type: .Poison, type2: .Water),
            Pokemon(name: "Toxapex", number: 748, image: UIImage(named: "748"), generation: "Gen 7", type: .Poison, type2: .Water),
            Pokemon(name: "Mudbray", number: 749, image: UIImage(named: "749"), generation: "Gen 7", type: .Ground, type2: nil),
            Pokemon(name: "Mudsdale", number: 750, image: UIImage(named: "750"), generation: "Gen 7", type: .Ground, type2: nil),
            Pokemon(name: "Dewpider", number: 751, image: UIImage(named: "751"), generation: "Gen 7", type: .Water, type2: .Bug),
            Pokemon(name: "Araquanid", number: 752, image: UIImage(named: "752"), generation: "Gen 7", type: .Water, type2: .Bug),
            Pokemon(name: "Fomantis", number: 753, image: UIImage(named: "753"), generation: "Gen 7", type: .Grass, type2: nil),
            Pokemon(name: "Lurantis", number: 754, image: UIImage(named: "754"), generation: "Gen 7", type: .Grass, type2: nil),
            Pokemon(name: "Morelull", number: 755, image: UIImage(named: "755"), generation: "Gen 7", type: .Grass, type2: .Fairy),
            Pokemon(name: "Shiinotic", number: 756, image: UIImage(named: "756"), generation: "Gen 7", type: .Grass, type2: .Fairy),
            Pokemon(name: "Salandit", number: 757, image: UIImage(named: "757"), generation: "Gen 7", type: .Poison, type2: .Fire),
            Pokemon(name: "Salazzle", number: 758, image: UIImage(named: "758"), generation: "Gen 7", type: .Poison, type2: .Fire),
            Pokemon(name: "Stufful", number: 759, image: UIImage(named: "759"), generation: "Gen 7", type: .Normal, type2: .Fighting),
            Pokemon(name: "Bewear", number: 760, image: UIImage(named: "760"), generation: "Gen 7", type: .Normal, type2: .Fighting),
            Pokemon(name: "Bounsweet", number: 761, image: UIImage(named: "761"), generation: "Gen 7", type: .Grass, type2: nil),
            Pokemon(name: "Steenee", number: 762, image: UIImage(named: "762"), generation: "Gen 7", type: .Grass, type2: nil),
            Pokemon(name: "Tsareena", number: 763, image: UIImage(named: "763"), generation: "Gen 7", type: .Grass, type2: nil),
            Pokemon(name: "Comfey", number: 764, image: UIImage(named: "764"), generation: "Gen 7", type: .Fairy, type2: nil),
            Pokemon(name: "Oranguru", number: 765, image: UIImage(named: "765"), generation: "Gen 7", type: .Normal, type2: .Psychic),
            Pokemon(name: "Passimian", number: 766, image: UIImage(named: "766"), generation: "Gen 7", type: .Fighting, type2: nil),
            Pokemon(name: "Wimpod", number: 767, image: UIImage(named: "767"), generation: "Gen 7", type: .Bug, type2: .Water),
            Pokemon(name: "Golisopod", number: 768, image: UIImage(named: "768"), generation: "Gen 7", type: .Bug, type2: .Water),
            Pokemon(name: "Sandygast", number: 769, image: UIImage(named: "769"), generation: "Gen 7", type: .Ghost, type2: .Ground),
            Pokemon(name: "Palossand", number: 770, image: UIImage(named: "770"), generation: "Gen 7", type: .Ghost, type2: .Ground),
            Pokemon(name: "Pyukumuku", number: 771, image: UIImage(named: "771"), generation: "Gen 7", type: .Water, type2: nil),
            Pokemon(name: "Type: Null", number: 772, image: UIImage(named: "772"), generation: "Gen 7", type: .Normal, type2: nil),
            Pokemon(name: "Silvally", number: 773, image: UIImage(named: "773"), generation: "Gen 7", type: .Normal, type2: nil),
            Pokemon(name: "Minior", number: 774, image: UIImage(named: "774"), generation: "Gen 7", type: .Rock, type2: .Flying),
            Pokemon(name: "Komala", number: 775, image: UIImage(named: "775"), generation: "Gen 7", type: .Normal, type2: nil),
            Pokemon(name: "Turtonator", number: 776, image: UIImage(named: "776"), generation: "Gen 7", type: .Fire, type2: .Dragon),
            Pokemon(name: "Togodemaru", number: 777, image: UIImage(named: "777"), generation: "Gen 7", type: .Electric, type2: .Steel),
            Pokemon(name: "Mimikyu", number: 778, image: UIImage(named: "778"), generation: "Gen 7", type: .Ghost, type2: .Fairy),
            Pokemon(name: "Bruxish", number: 779, image: UIImage(named: "779"), generation: "Gen 7", type: .Water, type2: .Psychic),
            Pokemon(name: "Drampa", number: 780, image: UIImage(named: "780"), generation: "Gen 7", type: .Normal, type2: .Dragon),
            Pokemon(name: "Dhelmise", number: 781, image: UIImage(named: "781"), generation: "Gen 7", type: .Ghost, type2: .Grass),
            Pokemon(name: "Jangmo-o", number: 782, image: UIImage(named: "782"), generation: "Gen 7", type: .Dragon, type2: nil),
            Pokemon(name: "Hakamo-o", number: 783, image: UIImage(named: "783"), generation: "Gen 7", type: .Dragon, type2: .Fighting),
            Pokemon(name: "Kommo-o", number: 784, image: UIImage(named: "784"), generation: "Gen 7", type: .Dragon, type2: .Fighting),
            Pokemon(name: "Tapu Koko", number: 785, image: UIImage(named: "785"), generation: "Gen 7", type: .Electric, type2: .Fairy),
            Pokemon(name: "Tapu Lele", number: 786, image: UIImage(named: "786"), generation: "Gen 7", type: .Psychic, type2: .Fairy),
            Pokemon(name: "Tapu Bulu", number: 787, image: UIImage(named: "787"), generation: "Gen 7", type: .Grass, type2: .Fairy),
            Pokemon(name: "Tapu Fini", number: 788, image: UIImage(named: "788"), generation: "Gen 7", type: .Water, type2: .Fairy),
            Pokemon(name: "Cosmog", number: 789, image: UIImage(named: "789"), generation: "Gen 7", type: .Psychic, type2: nil),
            Pokemon(name: "Cosmoem", number: 790, image: UIImage(named: "790"), generation: "Gen 7", type: .Psychic, type2: nil),
            Pokemon(name: "Solgaleo", number: 791, image: UIImage(named: "791"), generation: "Gen 7", type: .Psychic, type2: .Steel),
            Pokemon(name: "Lunala", number: 792, image: UIImage(named: "792"), generation: "Gen 7", type: .Psychic, type2: .Ghost),
            Pokemon(name: "Nihilego", number: 793, image: UIImage(named: "793"), generation: "Gen 7", type: .Rock, type2: .Poison),
            Pokemon(name: "Buzzwole", number: 794, image: UIImage(named: "794"), generation: "Gen 7", type: .Bug, type2: .Fighting),
            Pokemon(name: "Pheromosa", number: 795, image: UIImage(named: "795"), generation: "Gen 7", type: .Bug, type2: .Fighting),
            Pokemon(name: "Xurkitree", number: 796, image: UIImage(named: "796"), generation: "Gen 7", type: .Electric, type2: nil),
            Pokemon(name: "Celesteela", number: 797, image: UIImage(named: "797"), generation: "Gen 7", type: .Steel, type2: .Flying),
            Pokemon(name: "Kartana", number: 798, image: UIImage(named: "798"), generation: "Gen 7", type: .Grass, type2: .Steel),
            Pokemon(name: "Guzzlord", number: 799, image: UIImage(named: "799"), generation: "Gen 7", type: .Dark, type2: .Dragon),
            Pokemon(name: "Necrozma", number: 800, image: UIImage(named: "800"), generation: "Gen 7", type: .Psychic, type2: nil),
            Pokemon(name: "Magearna", number: 801, image: UIImage(named: "801"), generation: "Gen 7", type: .Steel, type2: .Fairy),
            Pokemon(name: "Marshadow", number: 802, image: UIImage(named: "802"), generation: "Gen 7", type: .Fighting, type2: .Ghost)
//            Pokemon(name: "Poipole", number: 803, image: UIImage(named: "803"), generation: "Gen 7", type: .Poison, type2: nil), //NEEDS Image
//            Pokemon(name: "Naganadel", number: 804, image: UIImage(named: "804"), generation: "Gen 7", type: .Poison, type2: .Dragon), //NEEDS Image
//            Pokemon(name: "Stakataka", number: 805, image: UIImage(named: "805"), generation: "Gen 7", type: .Rock, type2: .Steel), // need image
//            Pokemon(name: "Blacephalon", number: 806, image: UIImage(named: "806"), generation: "Gen 7", type: .Fire, type2: .Ghost), // need image
//            Pokemon(name: "Zeraora", number: 807, image: UIImage(named: "807"), generation: "Gen 7", type: .Electric, type2: nil) // need image
        ]
    }

//    override func viewWillAppear(_ animated: Bool) {
//        tableView.reloadData()
//    }
    
    
   
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredPokemons.count
        }
        return pokemons.count
    }

 
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pokemon: Pokemon
        if isFiltering() {
            pokemon = filteredPokemons[indexPath.row]
        } else {
            pokemon = pokemons[indexPath.row]
        }
        
        cell.textLabel?.text = "\(pokemon.number) - \(pokemon.name)"
        cell.textLabel?.font = UIFont(name:"Avenir", size:24)

        
        if let type2 = pokemon.type2 {
            cell.detailTextLabel?.text = "Type: \(pokemon.type), \(type2)"
        } else {
            cell.detailTextLabel?.text = "Type: \(pokemon.type)"
        }
        
        cell.imageView?.image = pokemon.image
        return cell
    }
    
   // var audioPlayer = AVAudioPlayer() // Delete -------------------------
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon: Pokemon
        if isFiltering() {
            pokemon = filteredPokemons[indexPath.row]
        } else {
            pokemon = pokemons[indexPath.row]
        }

        performSegue(withIdentifier: "toDetailView", sender: pokemon)
        
    }
    

    
    
//    // MARK: - Segues
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toDetailView" {
//            if let indexPath = tableView.indexPathsForSelectedRows {
//                let pokemon: Pokemon
//                if isFiltering() {
//                    pokemon = filteredPokemons[indexPath.row]
//                } else {
//                    pokemon = pokemons[indexPath.row]
//                }
//                let controller = (segue.destination as! UINavigationController).topViewController as! PokemonDetailViewController
//                controller.detailPokemon = pokemon
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? PokemonDetailViewController, let pokemon = sender as? Pokemon
            else {
                return
        }
        vc.detailPokemon = pokemon
    }




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    // MARK: -Private instatnce methods
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredPokemons = pokemons.filter({( pokemon : Pokemon) -> Bool in
            let doesGenerationMatch = (scope == "All") || (pokemon.generation == scope)
            
            if searchBarIsEmpty() {
                return doesGenerationMatch
            } else {
                return doesGenerationMatch && pokemon.name.lowercased().contains(searchText.lowercased())
            }
        })
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
}



extension PokeTableViewController: UISearchBarDelegate {
    // MARK : -UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print(selectedScope)
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension PokeTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}



    

