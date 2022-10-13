//
//  ContentView.swift
//  Kingdom Mystery App
//
//  Created by Kate McCarthy on 10/7/22.
//

import SwiftUI
let blankRoom = Room(im:"", rL: nil, rR: nil, c: [])
/*let eagle = Character(nm:"Eagle", im:"eagle", loca: blankRoom)
let beaver = Character(nm:"Beaver", im:"beaver", loca: blankRoom)
let redPanda = Character(nm:"Pamda", im:"redpanda", loca: blankRoom)
let bear = Character(nm:"Bear", im:"bear", loca: blankRoom)
let tiger = Character(nm:"Tiger", im:"tiger", loca: blankRoom)
let racc = Character(nm:"Racc", im:"raccoon", loca: blankRoom)
let penguin = Character(nm:"Pemguin", im:"penguin", loca: blankRoom)
let dog = Character(nm:"Dog", im:"dog-asleep", loca: blankRoom)*/

//let chars = testingChars();
struct  ContentView: View {
    var body: some View {
        
    
        VStack{
            Text("Well something is working")
            Button(action:{
                print("Man")
            }){
                if let char = Char.chars{
                    Image(char.img).resizable().frame(width: 150.0, height: 160.0).imageScale(.small)
                }
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
