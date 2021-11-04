//
//  ContentView.swift
//  Africa
//
//  Created by Alexander Rojas Benavides on 9/10/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridvViewActive:  Bool =  false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    
    //MARK: - Functions
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count  % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn  {
        case 1:
            toolbarIcon =  "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridvViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: NavigationLink
                        }//: ForEach
                        CreditsView()
                            .modifier(CenterModifier())
                    }//:List
                } else {
                    ScrollView(.vertical, showsIndicators: false)  {
                        LazyVGrid(columns: gridLayout,alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: NavigationLink
                            }//: ForEach
                        }//: LazyVGrid
                        .padding(10)
                        .animation(.easeIn)
                    }//: ScrollView
                }//: Condition
            }//: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar  {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            print("The list is activated")
                            isGridvViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridvViewActive ?  .primary : .accentColor)
                        })
                        
                        Button(action: {
                            print("Grid view is activated")
                            isGridvViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridvViewActive ? .accentColor : .primary)
                        })
                    }//: HStack
                }//: Toolbar Item
            }//: Toolbar
        }//: Navigation View
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
