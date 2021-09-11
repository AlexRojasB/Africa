//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Alexander Rojas Benavides on 9/11/21.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //MARK: - Properties
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://www.wikipedia.com"))!)
                }//: Group
                .foregroundColor(.accentColor)
            }//: HStack
        }//: GroupBox
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
