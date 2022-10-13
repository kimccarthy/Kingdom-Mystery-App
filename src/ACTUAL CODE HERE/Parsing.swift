//
//  Parsing.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 10/10/22.
//
import Foundation


let json = try? JSONSerialization.jsonObject(with: data, options: [])

struct Char: Codable{
    var name: String
    var img: String
    var img2: String?
    var intro: Array<String>
    var initial: Array<String>
    var crown:Array<String>?
    var diamond: Array<String>?
    var vaultNote: Array<String>?
    var redBerries: Array<String>?
    var greenBerries: Array<String>?
    var disguising: Array<String>?
    var priest: Array<String>?
    var invoice: Array<String>?
    var potion: Array<String>?
    var recipe: Array<String>?
    var caves: Array<String>?
    var statueMissing: Array<String>?
    var statueSold: Array<String>?
    var statue: Array<String>?
    var chest: Array<String>?
    var letters:Array<String>?
    
    /*static var chars: Char?{
        Char.fromJSON(named: "dialogue")
    }
    static func fromJSON(named name: String) -> Char? {
        if let data = Data.fromJSONFile(forName: name){
            let decoder = JSONDecoder()
            do {
                let chars = try decoder.decode(Char.self, from: data)
                return chars
            }
            catch{
                print("Couldn't init characters", error.localizedDescription)
            }
        }
        return nil
    }
    */
    
}

extension Char {
    init?(json: [String: Any]) {
        guard let name = json["name"] as? String,
            let img = json["img"] as? String,
            let img2 = json["img2"] as? String,
            let crown = json["crown"] as? [String],
            let intro = json["intro"] as? [String],
            let initial = json["initial"] as? [String],
            let diamond = json["diamond"] as? [String],
            let vaultNote = json["vaultNote"] as? [String],
            let redBerries = json["redBerries"] as? [String],
            let greenBerries = json["greenBerries"] as? [String],
            let disguising = json["disguising"] as? [String],
            let priest = json["priest"] as? [String],
            let invoice = json["invoice"] as? [String],
            let potion = json["potion"] as? [String],
            let recipe = json["recipe"] as? [String],
            let caves = json["caves"] as? [String],
            let statueMissing = json["statueMissing"] as? [String],
            let statueSold = json["statueSold"] as? [String],
            let statue = json["statue"] as? [String],
            let chest = json["chest"] as? [String],
            let letters = json["letters"] as? [String]
        else {
            print("Not all values exist")
            return nil
        }
        self.name = name
        self.img = img
        self.img2 = img2
        self.crown = crown
        self.intro = intro
        self.initial = initial
        self.diamond = diamond
        self.vaultNote = vaultNote
        self.redBerries = redBerries
        self.greenBerries = greenBerries
        self.disguising = disguising
        self.priest = priest
        self.invoice = invoice
        self.potion = potion
        self.recipe = recipe
        self.caves = caves
        self.statueMissing = statueMissing
        self.statueSold = statueSold
        self.statue = statue
        self.chest = chest
        self.letters = letters
        
    }
}

extension Char {
    private let urlComponents: URLComponents
    private let session: URLSession

    static func characters(matching query: String, completion: ([Char]) -> Void) {
        var searchURLComponents = urlComponents
        searchURLComponents.path = "/search"
        searchURLComponents.queryItems = [URLQueryItem(name: "q", value: query)]
        let searchURL = searchURLComponents.url!

        session.dataTask(url: searchURL, completion: { (_, _, data, _)
            var chars: [Char] = []

            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                for case let result in json["dialogue"] {
                    if let c = Char(json: result) {
                        chars.append(c)
                    }
                }
            }

            completion(chars)
        }).resume()
    }
}


func testingChars() -> Array<Character> {
    let blankRoom = Room(im:"", rL: nil, rR: nil, c: [])
    let eagle = Character(nm:"Eagle", im:"eagle", loca: blankRoom)
    let beaver = Character(nm:"Beaver", im:"beaver", loca: blankRoom)
    let redPanda = Character(nm:"Pamda", im:"redpanda", loca: blankRoom)
    let bear = Character(nm:"Bear", im:"bear", loca: blankRoom)
    let tiger = Character(nm:"Tiger", im:"tiger", loca: blankRoom)
    let racc = Character(nm:"Racc", im:"raccoon", loca: blankRoom)
    let penguin = Character(nm:"Pemguin", im:"penguin", loca: blankRoom)
    let dog = Character(nm:"Dog", im:"dog-asleep", loca: blankRoom)
    var characters:Array<Character> = []
    characters.append(eagle);
    characters.append(beaver);
    characters.append(redPanda);
    characters.append(bear);
    characters.append(tiger);
    characters.append(racc);
    characters.append(penguin);
    characters.append(dog);
    return characters
}

