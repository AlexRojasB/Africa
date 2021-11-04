//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Macbook on 3/11/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - Properties
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals:[Animal]  = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
