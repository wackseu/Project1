//
//  TableViewController.swift
//  Project1_Bala
//
//  Created by student on 5/2/23.
//

import UIKit
import PokemonAPI

class TableViewController: UITableViewController {
    
    var pokeNameKey = "pokemon-name-"
    var pokemonIDTableRow: String?
    var pokemonIDDetailView: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("title", comment: "")
        self.tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        pokemonIDTableRow = (pokeNameKey + String(indexPath.row+1))
        cell.textLabel?.text = NSLocalizedString(pokemonIDTableRow!, comment: "")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 151
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pokemonIDDetailView = String(indexPath.row+1)
        goToPokemonDetailsViewController(pokemonIDDetailView)
    }
    func goToPokemonDetailsViewController(_ pokemonIDDetailView: String?) {
        let storyboard = UIStoryboard(name: "PokemonDetailsViewController", bundle: nil)
        guard let pokemonDetailsViewController = storyboard.instantiateViewController(withIdentifier: "Pokedex") as? PokemonDetailsViewController else { return }
        pokemonDetailsViewController.pokemonID = pokemonIDDetailView
        navigationController?.pushViewController(pokemonDetailsViewController, animated: true)
    }
    
    
}
