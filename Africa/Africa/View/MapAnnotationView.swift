//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Alexander Rojas Benavides on 9/28/21.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - Property
    var location: NationalParkLocation
    @State private var animationRing: Double = 0.0
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54)
            
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52, height: 52)
                .scaleEffect(1 + CGFloat(animationRing))
                .opacity(1 - animationRing )
            
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48)
            .clipShape(Circle())
        }//: ZStack
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)){
                animationRing = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
