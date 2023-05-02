//
//  PokemonDetailsViewController.swift
//  Project1_Bala
//
//  Created by student on 5/2/23.
//

import UIKit
import PokemonAPI

class PokemonDetailsViewController: UIViewController {
    var pokeNameKey = "pokemon-name-"
    var pokemonID: String?
    var fullPokemonNameKey: String?
    var searchResponse: SearchResponse?
    var pokemonSpriteURL: String?
    var pokemonElementTypeKey = "-display-text"
    var slot = [ElementSlot]()
    var slotColor: UIColor!
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullPokemonNameKey = (pokeNameKey+pokemonID!)
        self.title = NSLocalizedString(fullPokemonNameKey!, comment: "")
        Label?.text = NSLocalizedString(fullPokemonNameKey!, comment: "")
        getSpriteAndTypes()
    }
    
    private func getSpriteAndTypes() {
        makeAPICall { searchResponse in
            self.searchResponse = searchResponse
            DispatchQueue.main.async { [self] in
                //Sprite
                let example = URL(string: pokemonSpriteURL!)
                let data = try? Data(contentsOf: example!)
                imageView?.image = UIImage(data: data!)
                //Types
                if (slot.count == 1){
                    let elementType1 = (slot[0].ElementDetails.name + pokemonElementTypeKey)
                    setUp1TypeLabel(elementType1)
                }
                if (slot.count == 2){
                    let elementType1 = (slot[0].ElementDetails.name + pokemonElementTypeKey)
                    let elementType2 = (slot[1].ElementDetails.name + pokemonElementTypeKey)
                    setUp2TypeLabels(elementType1, elementType2)
                }
                
                
            }
        }
        
    }
    
    private func setUp1TypeLabel (_ pokemonTypeID: String?){
        let label1 = UILabel()
        let decodedType = NSLocalizedString(pokemonTypeID!, comment: "")
        label1.layer.masksToBounds = true
        label1.frame = CGRect(x: 140, y: 350, width: 100, height: 30)
        label1.text = decodedType
        label1.textColor = .white
        label1.textAlignment = .center
        label1.layer.cornerRadius = 5.0
        label1.backgroundColor = .lightGray
        chooseLabelcolor(decodedType)
        label1.backgroundColor = slotColor
        view.addSubview(label1)
    }
    private func setUp2TypeLabels (_ pokemonType1ID: String?, _ pokemongType2ID: String?) {
        let label1 = UILabel()
        let decodedType1 = NSLocalizedString(pokemonType1ID!, comment: "")
        label1.textColor = .white
        label1.layer.masksToBounds = true
        label1.frame = CGRect(x: 85, y: 350, width: 100, height: 30)
        label1.text = decodedType1
        label1.textAlignment = .center
        label1.layer.cornerRadius = 5.0
        chooseLabelcolor(decodedType1)
        label1.backgroundColor = slotColor
        view.addSubview(label1)
        
        let label2 = UILabel()
        let decodedType2 = NSLocalizedString(pokemongType2ID!, comment: "")
        label2.textColor = .white
        label2.layer.masksToBounds = true
        label2.frame = CGRect(x: 195, y: 350, width: 100, height: 30)
        label2.text = decodedType2
        label2.textAlignment = .center
        label2.layer.cornerRadius = 5.0
        chooseLabelcolor(decodedType2)
        label2.backgroundColor = slotColor
        view.addSubview(label2)
    }
    
    private func chooseLabelcolor (_ decodedType: String?) {
        switch traitCollection.userInterfaceStyle {
            case .light, .unspecified:
            switch(decodedType) {
                case ("Bug"):
                    slotColor = hexStringToUIColor(hex: "#A8B820")
                case ("Dark"):
                    slotColor = hexStringToUIColor(hex: "#705848")
                case ("Dragon"):
                    slotColor = hexStringToUIColor(hex: "#7038F8")
                case ("Electric"):
                    slotColor = hexStringToUIColor(hex: "#F8D030")
                case ("Fairy"):
                    slotColor = hexStringToUIColor(hex: "#EE99AC")
                case ("Fighting"):
                    slotColor = hexStringToUIColor(hex: "#C03028")
                case ("Fire"):
                    slotColor = hexStringToUIColor(hex: "#F08030")
                case ("Flying"):
                    slotColor = hexStringToUIColor(hex: "#A890F0")
                case ("Ghost"):
                    slotColor = hexStringToUIColor(hex: "#705898")
                case ("Grass"):
                    slotColor = hexStringToUIColor(hex: "#78C850")
                case ("Ground"):
                    slotColor = hexStringToUIColor(hex: "#E0C068")
                case ("Ice"):
                    slotColor = hexStringToUIColor(hex: "#98D8D8")
                case ("Normal"):
                    slotColor = hexStringToUIColor(hex: "#A8A878")
                case ("Poison"):
                    slotColor = hexStringToUIColor(hex: "#A040A0")
                case ("Psychic"):
                    slotColor = hexStringToUIColor(hex: "#F85888")
                case ("Rock"):
                    slotColor = hexStringToUIColor(hex: "#B8A038")
                case ("Steel"):
                    slotColor = hexStringToUIColor(hex: "#B8A038")
                case ("Water"):
                    slotColor = hexStringToUIColor(hex: "#6890F0")
                default:
                    slotColor = .lightGray
            }
            case .dark:
            switch(decodedType) {
                case ("Bug"):
                    slotColor = hexStringToUIColor(hex: "#6D7815")
                case ("Dark"):
                    slotColor = hexStringToUIColor(hex: "#49392F")
                case ("Dragon"):
                    slotColor = hexStringToUIColor(hex: "#7038F8")
                case ("Electric"):
                    slotColor = hexStringToUIColor(hex: "#A1871F")
                case ("Fairy"):
                    slotColor = hexStringToUIColor(hex: "#9B6470")
                case ("Fighting"):
                    slotColor = hexStringToUIColor(hex: "#7D1F1A")
                case ("Fire"):
                    slotColor = hexStringToUIColor(hex: "#9C531F")
                case ("Flying"):
                    slotColor = hexStringToUIColor(hex: "#6D5E9C")
                case ("Ghost"):
                    slotColor = hexStringToUIColor(hex: "#493963")
                case ("Grass"):
                    slotColor = hexStringToUIColor(hex: "#4E8234")
                case ("Ground"):
                    slotColor = hexStringToUIColor(hex: "#927D44")
                case ("Ice"):
                    slotColor = hexStringToUIColor(hex: "#638D8D")
                case ("Normal"):
                    slotColor = hexStringToUIColor(hex: "#6D6D4E")
                case ("Poison"):
                    slotColor = hexStringToUIColor(hex: "#682A68")
                case ("Psychic"):
                    slotColor = hexStringToUIColor(hex: "#A13959")
                case ("Rock"):
                    slotColor = hexStringToUIColor(hex: "#786824")
                case ("Steel"):
                    slotColor = hexStringToUIColor(hex: "#787887")
                case ("Water"):
                    slotColor = hexStringToUIColor(hex: "#445E9C")
                default:
                    slotColor = .lightGray
            }
        }
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
        
    func makeAPICall(completion: @escaping (SearchResponse?) -> Void) {
        print("Start PokemonDetailsViewController API call\n")
        let domain = "https://pokeapi.co/api/v2/pokemon/"
        guard let url = URL(string: "\(domain)\(pokemonID!)") else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            var searchResponse: SearchResponse?
            defer {completion(searchResponse)}
            if let error = error {
                print("Error with API call: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
            else {
                print("Error with the response (\(String(describing: response))")
                return
            }
            if let data = data,
               let response = try? JSONDecoder().decode(SearchResponse.self, from: data)
            {
                print("PokemonDetailsViewController API call successful\n")
                self.pokemonSpriteURL = response.Sprites.Front
                self.slot = response.ElementTypes
            } else {
                print("Something is wrong with decoding, probably.")
            }
        }
        task.resume()
    }
        
}
    
    
    struct SearchResponse: Codable {
        let Sprites: Sprites
        let ElementTypes: [ElementSlot]
        
        
        
        enum CodingKeys: String, CodingKey {
            case Sprites = "sprites"
            case ElementTypes = "types"
        }
    }
    
    struct Sprites: Codable {
        let Front: String
        enum CodingKeys: String, CodingKey{
            case Front = "front_default"
        }
    }
    
    struct ElementSlot: Codable {
        let Slot: Int
        let ElementDetails: ElementDetails
        
        enum CodingKeys: String, CodingKey{
            case Slot = "slot"
            case ElementDetails = "type"
        }
    }
    
    struct ElementDetails: Codable {
        let name: String
        enum CodingKeys: String, CodingKey{
            case name = "name"
        }
    }
    
    
    

