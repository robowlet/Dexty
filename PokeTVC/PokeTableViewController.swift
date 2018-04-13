//
//  PokeTableViewController.swift
//  PokeTVC
//
//  Created by Rob Miguel on 4/10/18.
//  Copyright © 2018 Rob Miguel. All rights reserved.
//

import UIKit

class PokeTableViewController: UITableViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Search Controller
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false

        navigationItem.searchController = searchController
        
        searchController.searchBar.setImage(UIImage(named: "pokeball2"), for: UISearchBarIcon.search, state: .normal)

        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "PokeSearch", attributes: [NSAttributedStringKey.foregroundColor: UIColor.orange])

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

//    override func viewWillAppear(_ animated: Bool) {
//        tableView.reloadData()
//    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pokemon = pokemons[indexPath.row]
        cell.textLabel?.text = "\(pokemon.number) - \(pokemon.name)"
        
        if let type2 = pokemon.type2 {
            cell.detailTextLabel?.text = "Type: \(pokemon.type), \(type2)"
        } else {
            cell.detailTextLabel?.text = "Type: \(pokemon.type)"
        }
        
        cell.imageView?.image = pokemon.image
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemons[indexPath.row]
        print("\(pokemon.name)")
        performSegue(withIdentifier: "toDetailView", sender: pokemon)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? PokemonDetailViewController, let pokemon = sender as? Pokemon
            else {
                return
        }
        vc.pokemon = pokemon
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
