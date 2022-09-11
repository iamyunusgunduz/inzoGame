//
//  ZayifAvMahalleView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 9.09.2022.
//

import SwiftUI
import Alamofire

struct ZayifAvMahalleView: View {
    @Environment(\.presentationMode) var sunumModu
    var gelenAvMinLevel:Int?
    var gelenAvMaxLevel:Int?
    
    let userDefaults = UserDefaults.standard
    @State var username:String?
    @State var token:String?
    
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
              UserBilgileriCekme()
              extractedFunc()
              MonsterVeriCekme()
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
    // user veri cekme
    
    fileprivate func UserBilgileriCekme() -> DataRequest {
        let usernameFunc = userDefaults.object(forKey: "username")! as! String
        let token    = userDefaults.object(forKey: "access_token")! as! String
        let headersa: HTTPHeaders = [
           // "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        return AF.request("http://yunusgunduz.site/inzoApi/public/api/\(usernameFunc)", method:.get,encoding: JSONEncoding.default, headers: headersa) .responseJSON { [self] (response) in
            
            
            if response.response?.statusCode == 200{
                let data = response.data!
               
                let object = try? JSONSerialization.jsonObject(with: data, options: [])
                
                let jsonResponse =  object as? [String: Any]
          
                
                username = usernameFunc
                userLevel = jsonResponse!["level"] as? String ?? "0"
                userBattleValue = jsonResponse!["battle_value"]! as? String ?? "0"
                userGold = jsonResponse!["gold"]! as? String ?? "0"
                userExp = jsonResponse!["exp"]! as? String ?? "0"
                userHpNow = jsonResponse!["hp_now"]! as? String ?? "0"
                userApPow = jsonResponse!["ab_pow"]! as? String ?? "0"
                userApDef = jsonResponse!["ab_def"]! as? String ?? "0"
                 

                
              
            }else{
                let data = response.data!
                
                let object = try? JSONSerialization.jsonObject(with: data, options: [])
                
                let jsonObject =  object as? [String: Any]
               
                let msjm  = jsonObject?["lvl"] as? String
                
                print("Debug Error mnster message :  \(msjm!)")
               
            }
        }
    }
    
    // Monster verileri cekme
    fileprivate func MonsterVeriCekme() -> DataRequest {
        
        let token    = userDefaults.object(forKey: "access_token")! as! String
        let headersa: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        return AF.request("http://yunusgunduz.site/inzoApi/public/api/monster?max=\(gelenAvMaxLevel)&min=\(gelenAvMinLevel)", method:.get,encoding: JSONEncoding.default, headers: headersa) .responseJSON { [self] (response) in
            
            
            if response.response?.statusCode == 200{
                let data = response.data!
               
                let object = try? JSONSerialization.jsonObject(with: data, options: [])
                
                let jsonResponse =  object as? [String: Any]
          
                
             
                monsterName = jsonResponse!["name"] as? String ?? "0"
                print(monsterName)
                print(gelenAvMinLevel!)
                print(gelenAvMaxLevel!)
                monsterLevel = jsonResponse!["lvl"]! as? String ?? "0"
                monsterGold = jsonResponse!["cost_gold"]! as? String ?? "0"
                monsterPow = jsonResponse!["pow"]! as? String ?? "0"
                monsterDef = jsonResponse!["def"]! as? String ?? "0"
                
                
              
            }else{
                let data = response.data!
                
                let object = try? JSONSerialization.jsonObject(with: data, options: [])
                
                let jsonObject =  object as? [String: Any]
               
                let msjm  = jsonObject?["lvl"] as? String
                
                print("Debug Error mnster message :  \(msjm!)")
               
            }
        }
    }

    // user update
    fileprivate func extractedFunc() -> DataRequest {
        let username = userDefaults.object(forKey: "username")! as! String
        let token    = userDefaults.object(forKey: "access_token")! as! String
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
                    
        return AF.request("http://yunusgunduz.site/inzoApi/public/api/user-update/\(username)?gold=\(gelenAvMaxLevel! + gelenAvMinLevel!)&exp=\(gelenAvMinLevel!)&hp_now=\(-gelenAvMaxLevel!)", method:.put,encoding: JSONEncoding.default, headers: headers) .responseJSON { [self] (response) in
            
            
            if response.response?.statusCode == 200{
                let data = response.data!
               
                let object = try? JSONSerialization.jsonObject(with: data, options: [])
                
                let jsonObject =  object as? [String: Any]
                
                let stateField2   = jsonObject?["message"] as? String
                print("Debug Error extractedFunc message :  \(stateField2!)")
                
                
                
                
              
            }else{
               let data = response.data!
                
                let object = try? JSONSerialization.jsonObject(with: data, options: [])
                
                let jsonObject =  object as? [String: Any]
               
                let stateField1  = jsonObject?["message"] as? String
                
                print("Debug Error extractedFunc stateField1 :  \(stateField1)")
               
            }
        }
    }

}

struct ZayifAvMahalleView_Previews: PreviewProvider {
    static var previews: some View {
        ZayifAvMahalleView()
    }
}



