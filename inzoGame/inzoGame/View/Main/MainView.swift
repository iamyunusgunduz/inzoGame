//
//  MainView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 6.09.2022.
//

import SwiftUI


struct MainView: View {
 
    var body: some View {
         
        TabView {
            GenelBakisView()
                .tabItem {
                    Label("GenelBakis", systemImage: "wallet.pass")
                    Text("GenelBakis")
                }
         
            ProfilView()
                .tabItem {
                    Label("Profil", systemImage: "person")
                    Text("Profil")
                      
                }
         
            SavasView()
                .tabItem {
                    Label("Savas", systemImage: "pencil.slash")
                    Text("Savas")
                }
         
            AyarlarView()
                .tabItem {
                    Label("Ayarlar", systemImage: "pencil")
                    Text("Ayarlar")
                }
        }
     
  
         
        
        
    }
    
 
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
