//
//  GenelBakisView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 8.09.2022.
//

import SwiftUI

struct GenelBakisView: View {
    let userDefaults = UserDefaults.standard
    @State var username:String=""
    @State var userEmail:String=""
    @State var userRace:String=""
    @State var userLevel:String=""
    @State var userBattleValue:String=""
    @State var userGold:String=""
    @State var userExp:String=""
    @State var userHpNow:String=""
    @State var userStatbattle:String=""
    @State var userStatWin:String=""
    @State var userStatLoss:String=""
    @State var userStatDraw:String=""
    @State var userAbPow:String=""
    @State var userAbDef:String=""

    

    var body: some View {
         
        NavigationView {
           
            VStack{
               
                Spacer()
                    Text("Kullanici Adi : \(username)")
                  
                    Text(" IRK : \(userRace)")
                  
                    Text(" Level : \(userLevel)")
                  Spacer()
                
                Text(" Savaş gucu : \(userBattleValue)")
                Text(" Para : \(userGold)")
                Text(" Tecrube : \(userExp)")
                VStack{
                    Text(" Can  : \(userHpNow)")
                    Text(" Guc : \(userAbPow)")
                    Text(" Savunma  : \(userAbDef)")
                    Spacer()
                    Text(" Yapilan Savas : \(userStatbattle)")
                    Text(" Kazanilan Savas : \(userStatWin)")
                    Text(" Kaybedilen Savas : \(userStatLoss)")
                    Text(" Berabare Biten Savas : \(userStatDraw)")
                    Spacer()
                }
                Spacer()
               
            
                    .onAppear {
                        veriCekmeMain()
                }
     
            }
             
                .navigationTitle("Genel Bakis")
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
                            userStatbattle = jsonResponse!["stat_battle"]! as! String
                            userStatWin = jsonResponse!["stat_win"]! as! String
                            userStatLoss = jsonResponse!["stat_loss"]! as! String
                            userStatDraw = jsonResponse!["stat_draw"]! as! String
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

struct GenelBakisView_Previews: PreviewProvider {
    static var previews: some View {
        GenelBakisView()
    }
}
