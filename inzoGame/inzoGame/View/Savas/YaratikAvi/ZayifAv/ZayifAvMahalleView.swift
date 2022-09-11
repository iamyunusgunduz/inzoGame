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
    @State var username:String?
    
    @State     var userLevel:String?
    @State    var userBattleValue:String?
    @State    var userGold:String?
    @State  var userExp:String?
    @State    var userHpNow:String?
    @State    var userApPow:String?
    @State   var userApDef:String?
    
    
    @State   var monsterName:String?
    @State    var monsterLevel:String?
    @State  var monsterGold:String?
    @State  var monsterPow:String?
    @State  var monsterDef:String?
    
   
    
    
    
    var body: some View {
       
        VStack{
            
          let rastgeleSayi = Int.random(in: 1...5)
          Text("").onAppear {
              veriCekmeMain()
              veriCekmeMonster()
      }
            let userLevelCasting = Int(userLevel ?? "0") ?? -9999
            
            if userLevelCasting == -9999 {
                Text("sonuclar yukleniyor").padding()
            }
            
            else {
                VStack{
                    HStack{
                        
                        Text("Avlanma Raporu").padding(10).foregroundColor(Color.red)
                    }
                   
                    VStack{
                        
                        Text("Saldıran: \(username ?? "none")  Savunan: \(monsterName ?? "none") ").padding()
                        Text("Saldıran lv: \(userLevel ?? "none")   Savunan lv: \(monsterLevel ?? "none") ").padding()
                        Text("Saldıran gold: \(userGold ?? "none")  Savunan gold: \(monsterGold ?? "none") ").padding()
                        Text("Saldıran Güç: \(userApPow ?? "none")  Savunan Güç: \(monsterPow ?? "none") ").padding()
                        Text("Saldıran Defans: \(userApDef ?? "none")    Savunan Defans: \(monsterDef ?? "none" ) ").padding(20)
                        
                     
                        Text("Av sonucu kalan can: \(userHpNow ?? "none")")
                        Text("Av sonucu exp:  \(userExp ?? "none")").padding()
                       
                        
                        
                        
                        
                        
                    }
                }
               
                
                
            }
            
            Button("TAMAM"){
                self.sunumModu.wrappedValue.dismiss()
            }
        }
       
        
       
    }
    fileprivate func veriCekmeMonster() {
     
        print("max: \(gelenAvMaxLevel!)")
        print("min: \(gelenAvMinLevel!)")
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
                            
                            
                            
                            
                            
                            monsterName = jsonResponse!["name"]! as? String
                            monsterLevel = (jsonResponse!["lvl"]! as! String)
                            monsterGold = (jsonResponse!["cost_gold"]! as! String)
                            monsterPow = (jsonResponse!["pow"]! as! String)
                            monsterDef = (jsonResponse!["def"]! as! String)
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
        
        let url = URL(string: "http://yunusgunduz.site/inzoApi/public/api/\(username ?? "admin")")
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
                            
                            
                           
                            
                             userLevel = jsonResponse!["level"] as! String ?? "0"
                            userBattleValue = jsonResponse!["battle_value"]! as! String ?? "0"
                            userGold = jsonResponse!["gold"]! as! String ?? "0"
                            userExp = jsonResponse!["exp"]! as! String ?? "0"
                            userHpNow = jsonResponse!["hp_now"]! as! String ?? "0"
                            userApPow = jsonResponse!["ab_pow"]! as! String ?? "0"
                            userApDef = jsonResponse!["ab_def"]! as! String ?? "0"
                           
                            
                            
                            
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
