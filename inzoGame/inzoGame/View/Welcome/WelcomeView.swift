//
//  ContentView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 6.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            VStack(alignment: .center){
                Spacer()
                NavigationLink(destination: LoginView()) {
                    Text("Giris Yap")
                }
                
                Spacer()
                NavigationLink(destination: RegisterView()) {
                    Text("Kayit ol")
                }
                Spacer()
            }.navigationTitle( Text("INZO GAME"))
            
            
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
