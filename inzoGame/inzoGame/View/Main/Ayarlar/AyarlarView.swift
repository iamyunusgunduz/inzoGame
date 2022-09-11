//
//  AyarlarView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 8.09.2022.
//

import SwiftUI
import Alamofire


struct AyarlarView: View {
    let userDefaults = UserDefaults.standard
    @State private var sayfaGecisAyarlar:Bool = false
  
    var body: some View {
        NavigationView {
           
                Section {
                    Text("Ayarlar").onAppear {
                        
                     
                }
                    
                      
                    
                    
                }
             
                .navigationTitle("Ayarlar Page")
                .fullScreenCover(isPresented: $sayfaGecisAyarlar) { WelcomeView() }
                .toolbar {
                    Button("Cikis yap"){
                        userDefaults.set("none", forKey: "username")
                        sayfaGecisAyarlar = true
                        print("none oldu")
                    }
                }
                
        }
    }
    
 
    
}

struct AyarlarView_Previews: PreviewProvider {
    static var previews: some View {
        AyarlarView()
    }
}
