//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Alexander Rojas Benavides on 9/11/21.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: - Properties
    let animal: Animal
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }//: HStack
        }//: ScrollView
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
