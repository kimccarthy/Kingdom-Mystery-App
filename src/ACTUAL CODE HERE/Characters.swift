//
//  Characters.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 10/7/22.
//

import Foundation

class Character{
    var name: String
    var img: String
    var royalty: Bool
    //var dialogue: [String]
    var location: Room
    init(nm: String, im: String, loca: Room){
        name = nm
        img = im
        //dialogue = dial
        location = loca
        royalty = false //royalty will not be given same dialogue boxes
    }
    func changeLocation(rm: Room){
        location = rm
        rm.addCharacter(c: self)
    }
    func makeRoyal(){ royalty = true }
    func testPrinting(){
        print("Fuck you")
    }
}

class Room{
    var img: String
    var roomLeft: Room?
    var roomRight: Room?
    var locked: Bool
    var characters: [Character]
    init(im: String, rL: Room?, rR: Room?, c: [Character]){
        img = im
        roomLeft = rL
        roomRight = rR
        locked = false
        characters = c
    }
    func unlock(){
        locked = false
    }
    func lock(){
        locked = true
    }
    func hasRoomLeft()-> Bool{
        if roomLeft != nil { return true }
        else{ return false }
    }
    func hasRoomRight()-> Bool{
        if roomRight != nil { return true }
        else{ return false }
    }
    func addCharacter(c: Character){ characters.append(c) }
}
