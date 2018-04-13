//
//  File.swift
//  PokeTVC
//
//  Created by Rob Miguel on 4/10/18.
//  Copyright © 2018 Rob Miguel. All rights reserved.
//

import UIKit

struct Pokemon {
    var name: String
    var number: Int
    var image: UIImage?
    var type: Type
    var type2: Type?
 
}

enum Type {
    case Normal
    case Fighting
    case Flying
    case Poison
    case Ground
    case Rock
    case Bug
    case Ghost
    case Steel
    case Fire
    case Water
    case Grass
    case Electric
    case Psychic
    case Ice
    case Dragon
    case Dark
    case Fairy
}

var pokemons: [Pokemon] = [
    Pokemon(name: "Bulbasaur", number: 1, image: UIImage(named: "1"), type: .Grass, type2: nil),
    Pokemon(name: "Ivysaur", number: 2, image: UIImage(named: "2"), type: .Grass, type2: nil),
    Pokemon(name: "Venusaur", number: 3, image: UIImage(named: "3"), type: .Grass, type2: nil),
    Pokemon(name: "Charmander", number: 4, image: UIImage(named: "4"), type: .Fire, type2: nil),
    Pokemon(name: "Charmeleon", number: 5, image: UIImage(named: "5"), type: .Fire, type2: nil),
    Pokemon(name: "Charizard", number: 6, image: UIImage(named: "6"), type: .Fire, type2: nil),
    Pokemon(name: "Squirtle", number: 7, image: UIImage(named: "7"), type: .Water, type2: nil),
    Pokemon(name: "Wartortle", number: 8, image: UIImage(named: "8"), type: .Water, type2: nil),
    Pokemon(name: "Blastoise", number: 9, image: UIImage(named: "9"), type: .Water, type2: nil),
    Pokemon(name: "Caterpie", number: 10, image: UIImage(named: "10"), type: .Bug, type2: nil),
    Pokemon(name: "Metapod", number: 11, image: UIImage(named: "11"), type: .Bug, type2: nil),
    Pokemon(name: "Butterfree", number: 12, image: UIImage(named: "12"), type: .Bug, type2: nil),
    Pokemon(name: "Weedle", number: 13, image: UIImage(named: "13"), type: .Bug, type2: nil),
    Pokemon(name: "Kakuna", number: 14, image: UIImage(named: "14"), type: .Bug, type2: nil),
    Pokemon(name: "Beedrill", number: 15, image: UIImage(named: "15"), type: .Bug, type2: nil),
    Pokemon(name: "Pidgey", number: 16, image: UIImage(named: "16"), type: .Flying, type2: nil),
    Pokemon(name: "Pidgeotto", number: 17, image: UIImage(named: "17"), type: .Flying, type2: nil),
    Pokemon(name: "Pidgeot", number: 18, image: UIImage(named: "18"), type: .Flying, type2: nil),
    Pokemon(name: "Rattata", number: 19, image: UIImage(named: "19"), type: .Normal, type2: nil),
    Pokemon(name: "Raticate", number: 20, image: UIImage(named: "20"), type: .Normal, type2: nil),
    Pokemon(name: "Spearow", number: 21, image: UIImage(named: "21"), type: .Flying, type2: nil),
    Pokemon(name: "Fearow", number: 22, image: UIImage(named: "22"), type: .Flying, type2: nil),
    Pokemon(name: "Ekans", number: 23, image: UIImage(named: "23"), type: .Poison, type2: nil),
    Pokemon(name: "Arbok", number: 24, image: UIImage(named: "24"), type: .Poison, type2: nil),
    Pokemon(name: "Pikachu", number: 25, image: UIImage(named: "25"), type: .Electric, type2: nil),
    Pokemon(name: "Raichu", number: 26, image: UIImage(named: "26"), type: .Electric, type2: nil),
    Pokemon(name: "Sandshrew", number: 27, image: UIImage(named: "27"), type: .Ground, type2: nil),
    Pokemon(name: "Sandslash", number: 28, image: UIImage(named: "28"), type: .Ground, type2: nil),
    Pokemon(name: "Nidoran♀", number: 29, image: UIImage(named: "29"), type: .Poison, type2: nil),
    Pokemon(name: "Nidorina", number: 30, image: UIImage(named: "30"), type: .Poison, type2: nil),
    Pokemon(name: "Nidoqueen", number: 31, image: UIImage(named: "31"), type: .Poison, type2: nil),
    Pokemon(name: "Nidoran♂", number: 32, image: UIImage(named: "32"), type: .Poison, type2: nil),
    Pokemon(name: "Nidorino", number: 33, image: UIImage(named: "33"), type: .Poison, type2: nil),
    Pokemon(name: "Nidoking", number: 34, image: UIImage(named: "34"), type: .Poison, type2: nil),
    Pokemon(name: "Clefairy", number: 35, image: UIImage(named: "35"), type: .Fairy, type2: nil),
    Pokemon(name: "Clefable", number: 36, image: UIImage(named: "36"), type: .Fairy, type2: nil),
    Pokemon(name: "Vulpix", number: 37, image: UIImage(named: "37"), type: .Fire, type2: nil),
    Pokemon(name: "Ninetales", number: 38, image: UIImage(named: "38"), type: .Fire, type2: nil),
    Pokemon(name: "Jigglypuff", number: 39, image: UIImage(named: "39"), type: .Fairy, type2: nil),
    Pokemon(name: "Wigglytuff", number: 40, image: UIImage(named: "40"), type: .Fairy, type2: nil),
    Pokemon(name: "Zubat", number: 41, image: UIImage(named: "41"), type: .Flying, type2: .Poison),
    Pokemon(name: "Golbat", number: 42, image: UIImage(named: "42"), type: .Flying, type2: .Poison),
    Pokemon(name: "Oddish", number: 43, image: UIImage(named: "43"), type: .Grass, type2: .Poison),
    Pokemon(name: "Gloom", number: 44, image: UIImage(named: "44"), type: .Grass, type2: .Poison),
    Pokemon(name: "Vileploom", number: 45, image: UIImage(named: "45"), type: .Grass, type2: .Poison),
    Pokemon(name: "Paras", number: 46, image: UIImage(named: "46"), type: .Bug, type2: .Grass),
    Pokemon(name: "Parasect", number: 47, image: UIImage(named: "47"), type: .Bug, type2: .Grass),
    Pokemon(name: "Venonat", number: 48, image: UIImage(named: "48"), type: .Bug, type2: .Poison),
    Pokemon(name: "Venomoth", number: 49, image: UIImage(named: "49"), type: .Bug, type2: .Poison),
    Pokemon(name: "Diglett", number: 50, image: UIImage(named: "50"), type: .Ground, type2: nil),
    Pokemon(name: "Dugtrio", number: 51, image: UIImage(named: "51"), type: .Ground, type2: nil),
    Pokemon(name: "Meowth", number: 52, image: UIImage(named: "52"), type: .Normal, type2: nil),
    Pokemon(name: "Persian", number: 53, image: UIImage(named: "53"), type: .Normal, type2: nil),
    Pokemon(name: "Psyduck", number: 54, image: UIImage(named: "54"), type: .Water, type2: nil),
    Pokemon(name: "Golduck", number: 55, image: UIImage(named: "55"), type: .Water, type2: nil),
    Pokemon(name: "Mankey", number: 56, image: UIImage(named: "56"), type: .Fighting, type2: nil),
    Pokemon(name: "Primape", number: 57, image: UIImage(named: "57"), type: .Fighting, type2: nil),
    Pokemon(name: "Growlithe", number: 58, image: UIImage(named: "58"), type: .Fire, type2: nil),
    Pokemon(name: "Arcanine", number: 59, image: UIImage(named: "59"), type: .Fire, type2: nil),
    Pokemon(name: "Poliwag", number: 60, image: UIImage(named: "60"), type: .Water, type2: nil),
    Pokemon(name: "Poliwhirl", number: 61, image: UIImage(named: "61"), type: .Water, type2: nil),
    Pokemon(name: "Poliwrath", number: 62, image: UIImage(named: "62"), type: .Water, type2: nil),
    Pokemon(name: "Abra", number: 63, image: UIImage(named: "63"), type: .Psychic, type2: nil),
    Pokemon(name: "Kadabra", number: 64, image: UIImage(named: "64"), type: .Psychic, type2: nil),
    Pokemon(name: "Alakazam", number: 65, image: UIImage(named: "65"), type: .Psychic, type2: nil),
    Pokemon(name: "Machop", number: 66, image: UIImage(named: "66"), type: .Fighting, type2: nil),
    Pokemon(name: "Machoke", number: 67, image: UIImage(named: "67"), type: .Fighting, type2: nil),
    Pokemon(name: "Machamp", number: 68, image: UIImage(named: "68"), type: .Fighting, type2: nil),
    Pokemon(name: "Bellsprout", number: 69, image: UIImage(named: "69"), type: .Grass, type2: .Poison),
    Pokemon(name: "Weepingbell", number: 70, image: UIImage(named: "70"), type: .Grass, type2: .Poison),
    Pokemon(name: "Victrybell", number: 71, image: UIImage(named: "71"), type: .Grass, type2: .Poison),
    Pokemon(name: "Tentacool", number: 72, image: UIImage(named: "72"), type: .Water, type2: .Poison),
    Pokemon(name: "Tentacruel", number: 73, image: UIImage(named: "73"), type: .Water, type2: .Poison),
    Pokemon(name: "Geodude", number: 74, image: UIImage(named: "74"), type: .Rock, type2: .Ground),
    Pokemon(name: "Graveler", number: 75, image: UIImage(named: "75"), type: .Rock, type2: .Ground),
    Pokemon(name: "Golem", number: 76, image: UIImage(named: "76"), type: .Rock, type2: .Ground),
    Pokemon(name: "Ponyta", number: 77, image: UIImage(named: "77"), type: .Fire, type2: nil),
    Pokemon(name: "Rapidash", number: 78, image: UIImage(named: "78"), type: .Fire, type2: nil),
    Pokemon(name: "Slowpoke", number: 79, image: UIImage(named: "79"), type: .Water, type2: .Psychic),
    Pokemon(name: "Slowbro", number: 80, image: UIImage(named: "80"), type: .Water, type2: .Psychic),
    Pokemon(name: "Magnemite", number: 81, image: UIImage(named: "81"), type: .Electric, type2: .Steel),
    Pokemon(name: "Megneton", number: 82, image: UIImage(named: "82"), type: .Electric, type2: .Steel),
    Pokemon(name: "Farfetch'd", number: 83, image: UIImage(named: "83"), type: .Normal, type2: .Flying),
    Pokemon(name: "Doduo", number: 84, image: UIImage(named: "84"), type: .Normal, type2: .Flying),
    Pokemon(name: "Dotrio", number: 85, image: UIImage(named: "85"), type: .Normal, type2: .Flying)
    
    

    ]
























