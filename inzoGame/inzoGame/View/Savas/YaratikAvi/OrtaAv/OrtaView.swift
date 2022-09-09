//
//  OrtaView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 8.09.2022.
//

import SwiftUI

struct OrtaView: View {
    @State private var sayfaGecisOrtaAvMahalle:Bool = false
    @State private var sayfaGecisOrtaAvKoy:Bool = false
    @State private var sayfaGecisOrtaAvSehir:Bool = false
    var body: some View {
        
        NavigationView{
            
        
        VStack{
            Spacer()
            Text("Mahalle 20 - 29 lv").padding()
            Button("Ava çık"){
                sayfaGecisOrtaAvMahalle = true
                
            }.sheet(isPresented: $sayfaGecisOrtaAvMahalle) {
                ZayifAvMahalleView(gelenSavasCarpaniDegeri:4)
                
            }
            Text("Köy 30 - 39 lv").padding()
            Button("Ava Çık"){
                sayfaGecisOrtaAvKoy = true
            }.sheet(isPresented: $sayfaGecisOrtaAvKoy) {
                ZayifAvKoyView(gelenSavasCarpaniDegeri:5)
            }
            
            Text("Şehir 40 - 49 lv").padding()
            Button("Ava Çık"){
                sayfaGecisOrtaAvSehir = true
            }.sheet(isPresented: $sayfaGecisOrtaAvSehir) {
                ZayifAvSehirView(gelenSavasCarpaniDegeri:6)
            }
            Spacer()
        }
        
    }.navigationTitle("Orta Yaratik Avi")
    }
}

struct OrtaView_Previews: PreviewProvider {
    static var previews: some View {
        OrtaView()
    }
}
