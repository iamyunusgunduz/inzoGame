//
//  ContentView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 6.09.2022.
//

import SwiftUI

struct WelcomeView: View {
    @State private var sayfaGecisWelcome:Bool = false
    let userDefaults = UserDefaults.standard
    
   
    var body: some View {
        NavigationView{
            
            VStack(alignment: .center){
                Spacer()
                    .onAppear{
                        var username = userDefaults.object(forKey: "username") as! String
                        var token = userDefaults.object(forKey: "access_token") as! String
                      print("gitrdi")
                        if      username != "none"  && token != "none"{
                            sayfaGecisWelcome = true
                            
                        }else {
                            sayfaGecisWelcome = false
                        }
                    }
                NavigationLink(destination: LoginView()) {
                    
                    
                    Text("Giris Yap")
                }
                
                Spacer()
                NavigationLink(destination: RegisterView()) {
                    Text("Kayit ol")
                }
                Spacer()
            }.navigationTitle( Text("INZO GAME"))
            
                .fullScreenCover(isPresented: $sayfaGecisWelcome) { MainView() }
        }
            
    }
}

 struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
