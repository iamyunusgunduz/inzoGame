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
    @State var userStatbattle:String=""
    @State var userStatWin:String=""
    @State var userStatLoss:String=""
    @State var userStatDraw:String=""
    
    
    

    var body: some View {
         
        NavigationView {
           
            
            VStack{
                     Spacer()
                     Text(" Yapilan Savas : \(userStatbattle)").padding(10)
                     Text(" Kazanilan Savas : \(userStatWin)").padding(10)
                     Text(" Kaybedilen Savas : \(userStatLoss)").padding(10)
                     Text(" Berabare Biten Savas : \(userStatDraw)").padding(10)
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
                            
                             userStatbattle = jsonResponse!["stat_battle"]! as! String
                             userStatWin = jsonResponse!["stat_win"]! as! String
                             userStatLoss = jsonResponse!["stat_loss"]! as! String
                             userStatDraw = jsonResponse!["stat_draw"]! as! String
                            
                            
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
