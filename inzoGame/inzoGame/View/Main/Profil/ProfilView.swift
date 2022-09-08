//
//  ProfilView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 8.09.2022.
//

import SwiftUI

struct ProfilView: View {
    let userDefaults = UserDefaults.standard
    @State var username:String=""
    @State var userEmail:String=""
    @State var userRace:String=""
    @State var userLevel:String=""
    @State var userBattleValue:String=""
    @State var userGold:String=""
    @State var userExp:String=""
    @State var userHpNow:String=""
    
    @State var userAbPow:String=""
    @State var userAbDef:String=""

    var body: some View {
        
        NavigationView{
            
            VStack{
               
                Spacer()
                
                VStack{
                    Text("Kullanici Adi : \(username)").padding(5)
                    
                    Text(" IRK : \(userRace)").padding(5)
                  
                    Text(" Level : \(userLevel)").padding(5)
                    
                }
                   Spacer()
                VStack{
                    Text(" Savaş gucu : \(userBattleValue)").padding(5)
                    Text(" Para : \(userGold)").padding(5)
                    Text(" Tecrube : \(userExp)").padding(5)
                }
                
                Spacer()
                
                VStack{
                    Text(" Can  : \(userHpNow)").padding(5)
                    
                    Text(" Guc : \(userAbPow)").padding(5)
                    
                    Text(" Savunma  : \(userAbDef)").padding(5)
                   
                   
                }
               
               
            
                   
                Spacer() .onAppear {
                    veriCekmeMain()
            }
            }
             
         
            .navigationTitle("Profil")
        }
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
                            userEmail = jsonResponse!["email"]! as! String
                            userRace = jsonResponse!["race"]! as! String
                            userLevel = jsonResponse!["level"]! as! String
                            userBattleValue = jsonResponse!["battle_value"]! as! String
                            userGold = jsonResponse!["gold"]! as! String
                            userExp = jsonResponse!["exp"]! as! String
                            userHpNow = jsonResponse!["hp_now"]! as! String
                            userAbPow = jsonResponse!["ab_pow"]! as! String
                            userAbDef = jsonResponse!["ab_def"]! as! String
                         
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            
        }.resume()
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
