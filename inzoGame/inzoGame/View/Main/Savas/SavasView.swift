//
//  SavasView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 8.09.2022.
//

import SwiftUI

struct SavasView: View {
    var body: some View {
        NavigationView{
            
            VStack(alignment: .center){
                Spacer()
                Text("Yaratik avi").padding(10)
                NavigationLink(destination: ZayifView()) {
                    HStack{
                        Text("Zayif AV")
                        Text("1-19 lv").padding(20).foregroundColor(Color.green)
                    }
                    
                }
                NavigationLink(destination: OrtaView()) {
                    HStack{
                        Text("Orta AV")
                    Text("20-49 lv").padding(15).foregroundColor(Color.orange)
                    }
                }
                NavigationLink(destination: GucluView()) {
                    HStack{
                        Text("Güçlü AV")
                    Text("50-100 lv").padding(15).foregroundColor(Color.red)
                    }
                }
                Spacer()
                Text("Rakip avi").padding(10)
                NavigationLink(destination: RastgeleRakipSavasView()) {
                    HStack{
                        Text("Rastgele rakip").padding(20)
                        
                    }
                    
                }
                NavigationLink(destination: EsitVeyaGucluRakipView()) {
                    HStack{
                        Text("Esit veya Guclu rakip").padding(10)
                    }
                }
                Spacer()
            }.navigationTitle( Text("WAR PAGE"))
            
               
        }
    }
}

struct SavasView_Previews: PreviewProvider {
    static var previews: some View {
        SavasView()
    }
}
