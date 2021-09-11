//
//  ContentView.swift
//  Africa
//
//  Created by Alexander Rojas Benavides on 9/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }//: List
            .navigationBarTitle("Africa", displayMode: .large)
        }//: Navigation View
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
