//
//  ContentView.swift
//  Roman_ArrieroT7
//
//  Created by user176695 on 01/11/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            FormView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Datos")
                }
            
            CardView()
                .tabItem {
                    Image(systemName: "person.crop.rectangle")
                    Text("Tarjeta")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
