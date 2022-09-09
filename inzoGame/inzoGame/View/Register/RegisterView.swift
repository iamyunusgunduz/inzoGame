//
//  RegisterView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 6.09.2022.
//

import SwiftUI
import Alamofire
struct RegisterView: View {
    @State private var sayfaGecisLogin:Bool = false
    let userDefaults = UserDefaults.standard
    @State private var uyariMesaji:String = ""
    @State private var username:String = ""
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var karakterSecim = 0
    
    var body: some View {
        NavigationView{
            Form{
               
                TextField("username",text:$username)
                TextField("Email",text:$email)
                SecureField("password",text:$password)
               
                Picker(selection: $karakterSecim,label: Text("")){
                    Text("Savasci").tag(0)
                    Text("Suikastci").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                
                
                    Button("Kayit ol") {
                        print("Debug Username : \(username)")
                        print("Debug Username : \(email)")
                        print("Debug Password : \(password)")

                        extractedFunc()
                        
                    }
                           
                
            }.navigationTitle("Register").fullScreenCover(isPresented: $sayfaGecisLogin) { LoginView() }
           
        }
        Text(uyariMesaji)
    }
    
fileprivate func extractedFunc() -> DataRequest {
    return AF.request("http://yunusgunduz.site/inzoApi/public/api/register?username=\(username)&email=\(email)&password=\(password)&race=\(karakterSecim)", method:.post,encoding: JSONEncoding.default) .responseJSON { [self] (response) in
        
        
        if response.response?.statusCode == 200{
            let data = response.data!
            
            let object = try? JSONSerialization.jsonObject(with: data, options: [])
            
            let jsonObject =  object as? [String: Any]
            print(jsonObject!)
            let stateField   = jsonObject?["message"] as? String
            
            let statusField   = jsonObject?["status"] as? String
            if stateField == "User created successfully"{
                
            
                sayfaGecisLogin = true
              print("\(username) kisisi \(karakterSecim) olarak olusturuldu")
                
                
                
            }else{
                uyariMesaji = "Tekrar deneyiniz"
            }
            if (statusField != nil) == false{
                uyariMesaji = "Tekrar deneyiniz"
            }
        }else{
            let data = response.data!
            
            let object = try? JSONSerialization.jsonObject(with: data, options: [])
            
            let jsonObject =  object as? [String: Any]
           
            let stateField   = jsonObject?["message"] as? String
            uyariMesaji = stateField!
        }
    }
}
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
