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
                        veriCekmeMain()
                        userDefaults.set("none", forKey: "username")
                        userDefaults.set("none", forKey: "access_token")
                        sayfaGecisAyarlar = true
                        print("none oldu")
                    }
                }
                
        }
    }
    
    fileprivate func veriCekmeMain() {
  
        
        let url = URL(string: "http://yunusgunduz.site/inzoApi/public/api/logout")
        let session  = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }else{
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        as? [String:Any]
                        DispatchQueue.main.async {
                            
                            
                            //print(jsonResponse!["level"]!)
                            
                            
                            //kasitli username yazmadim
                            
                            
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            
        }.resume()
    }
    
}

struct AyarlarView_Previews: PreviewProvider {
    static var previews: some View {
        AyarlarView()
    }
}
