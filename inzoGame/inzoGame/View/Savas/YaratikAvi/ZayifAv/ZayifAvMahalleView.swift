//
//  ZayifAvMahalleView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 9.09.2022.
//

import SwiftUI

struct ZayifAvMahalleView: View {
    @Environment(\.presentationMode) var sunumModu
    var gelenAvMinLevel:Int?
    var gelenAvMaxLevel:Int?
    
    let userDefaults = UserDefaults.standard
    @State var username:String=""
    
    @State    var userLevel:String = " "
    @State   var userBattleValue:String = " "
    @State   var userGold:String = " "
    @State  var userExp:String = " "
    @State    var userHpNow:String = " "
    @State    var userApPow:String = " "
    @State   var userApDef:String = " "
    
    
    var body: some View {
       
        VStack{
            
          let rastgeleSayi = Int.random(in: 1...5)
          Text("").onAppear {
              veriCekmeMain()
              veriCekmeMonster()
           
      }
            let userLevelCasting = Int(userLevel) ?? -9999
            
            
            if userLevelCasting == -9999 {
                Text("sonuclar yukleniyor").padding()
            }
            
            else {
                Text("Rakip  cikti \(gelenAvMinLevel!) ,  \(gelenAvMaxLevel!)").padding()
            }
            
            Button("TAMAM"){
                self.sunumModu.wrappedValue.dismiss()
            }
        }
       
        
       
    }
    fileprivate func veriCekmeMonster() {
     
        print("max: \(gelenAvMaxLevel)")
        print("min: \(gelenAvMinLevel)")
        let url = URL(string: "http://yunusgunduz.site/inzoApi/public/api/monster?max=\(gelenAvMaxLevel!)&min=\(gelenAvMinLevel!)")
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
                            
                            print(jsonResponse!["name"]!)
                            
                            
                            //kasitli username yazmadim
                            
                          //   userLevel = jsonResponse!["level"]! as! String
                            
                            
                            
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            
        }.resume()
    }
    
    fileprivate func veriCekmeMain() {
        username = userDefaults.object(forKey: "username")! as! String
        
        let url = URL(string: "http://yunusgunduz.site/inzoApi/public/api/\(username)")
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
                            
                            print(jsonResponse!["level"]!)
                            
                            
                            //kasitli username yazmadim
                            
                             userLevel = jsonResponse!["level"]! as! String
                            
                            
                            
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            
        }.resume()
    }
}

struct ZayifAvMahalleView_Previews: PreviewProvider {
    static var previews: some View {
        ZayifAvMahalleView()
    }
}
