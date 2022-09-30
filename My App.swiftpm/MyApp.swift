


//ident in both item and person is a unique code to make them hashable
struct Item:Hashable{
    var collected = false
    var sprite: String
    var ident: Int
    var hashValue: Int {
        return ident
    }
}
struct Dialogue{
    var seen = false
    var lines: [String] = []
}
class Person:Hashable{
    var sprite: String
    var name: String
    var ident: Int
    var hashValue: Int {
        return ident
    }
    init(sp:String, nm:String, i:Int){
        sprite = sp
        name = nm
        ident = i
    }
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.ident == rhs.ident
    }
}

//Person will also include the player sprite, just draws the actual sprites

//NPC will have more detailed information about item interactions, dialogue.... 

class NPC:Person{
    var occupation: String
    var detailedSprites: [String] = []
    var itemArr: [Item: Dialogue] = [:]
    init(sp:String, nm: String, occ: String, dtSpr:[String], itArr:[Item:Dialogue], i:Int){
        sprite = sp
        name = nm
        occupation = occ
        detailedSprites = dtSpr
        itemArr = itArr
        ident = i
    }
}

class Location{
    var background: String
    var characters: [Person: Double] = [:] //double is location on screen
    //i think what i'll do for moving characters is create a location 1 and a location 2 with the same image
    
    //which is to the left and which is to the right
    var right: Location?
    var left: Location?
    var mapCoord: (Int, Int)//might take this out, but a map function that takes current player location and places them on the map.
    
    init(str: String, chr: [Person:Double], rt:Location?, lt: Location?, mc: (Int, Int)){
        
        
    }
    
}

