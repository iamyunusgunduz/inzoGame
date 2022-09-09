//
//  LoginView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 6.09.2022.
//

import SwiftUI
import Alamofire
struct LoginView: View {
    
    @State private var username:String = "yunus"
    @State private var password:String = "1234"
    @State private var uyariMesaji:String = ""
    @State private var sayfaGecisLogin:Bool = false
    let userDefaults = UserDefaults.standard
    
    

    var body: some View {
        NavigationView{
            Form{
               
                TextField("username",text:$username)
                
                SecureField("password",text:$password)
               
                    Button("GIRIS YAP") {
                        print("Debug Username : \(username)")
                        print("Debug Password : \(password)")
                        extractedFunc()
                        
                    }
                           
                
            }.navigationTitle("Login").fullScreenCover(isPresented: $sayfaGecisLogin) { MainView() }
         
        }
        Text(uyariMesaji)
    }
    
    
    
    
fileprivate func extractedFunc() -> DataRequest {
    return AF.request("http://yunusgunduz.site/inzoApi/public/api/login?username=\(username)&password=\(password)", method:.post,encoding: JSONEncoding.default) .responseJSON { [self] (response) in
        
        
        if response.response?.statusCode == 200{
            let data = response.data!
            
            let object = try? JSONSerialization.jsonObject(with: data, options: [])
            
            let jsonObject =  object as? [String: Any]
            
            let tokenField   = jsonObject?["access_token"] as? String
            
            let stateField   = jsonObject?["message"] as? String
            
            
            if stateField == "success"{
                
                sayfaGecisLogin = true
                userDefaults.set(username, forKey: "username")
                userDefaults.set(password, forKey: "password")
                userDefaults.set(tokenField, forKey: "tokenField")
                
                
                
            }else{
                uyariMesaji = "Tekrar deneyiniz"
            }
        }else{
            let data = response.data!
            
            let object = try? JSONSerialization.jsonObject(with: data, options: [])
            
            let jsonObject =  object as? [String: Any]
           
            let stateField2   = jsonObject?["message"] as? String
            uyariMesaji = stateField2!
        }
    }
}

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
       
    }
}
