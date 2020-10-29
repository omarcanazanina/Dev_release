//
//  TabsView.swift
//  Fastgi_v1
//
//  Created by Hegaro on 26/10/2020.
//

import SwiftUI

struct TabsView: View {
    @State private var selectedTab:Int? = 0
    var body: some View {
            TabView(selection: $selectedTab) {
                Text("Perfil")
                    .onTapGesture {
                        self.selectedTab = 1
                    }
                    .tabItem {
                        Image(systemName: "star")
                        Text("Perfil")
                    }
                    .tag(0)

                Text("Historial")
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Historial")
                       // self.selectedTab = 1
                    }
                    .tag(1)
                
                Text("Ajustes")
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Ajustes")
                    }
                    .tag(2)
            }
        }
    }
    /*var body: some View {
        TabView {
            Text("Inicio")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Inicio")
                }
            Text("Historial")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Historial")
                }
            Text("Ajustes")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Ajustes")
                }
        }
        .font(.headline)
    }
}*/

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
