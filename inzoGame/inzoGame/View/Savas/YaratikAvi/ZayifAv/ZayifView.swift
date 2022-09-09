//
//  ZayifView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 8.09.2022.
//

import SwiftUI

struct ZayifView: View {
    @State private var sayfaGecisZayifAvMahalle:Bool = false
    @State private var sayfaGecisZayifAvKoy:Bool = false
    @State private var sayfaGecisZayifAvSehir:Bool = false
    var body: some View {
        
        NavigationView{
            
        
        VStack{
            Spacer()
            Text("Mahalle 1-5 lv").padding()
            Button("Ava çık"){
                sayfaGecisZayifAvMahalle = true
                
            }.sheet(isPresented: $sayfaGecisZayifAvMahalle) {
                ZayifAvMahalleView(gelenSavasCarpaniDegeri:1)
                
            }
            Text("Köy 6-10 lv").padding()
            Button("Ava Çık"){
                sayfaGecisZayifAvKoy = true
            }.sheet(isPresented: $sayfaGecisZayifAvKoy) {
                ZayifAvKoyView(gelenSavasCarpaniDegeri:2)
            }
            
            Text("Şehir 11-19 lv").padding()
            Button("Ava Çık"){
                sayfaGecisZayifAvSehir = true
            }.sheet(isPresented: $sayfaGecisZayifAvSehir) {
                ZayifAvSehirView(gelenSavasCarpaniDegeri:3)
            }
            Spacer()
        }
        
    }.navigationTitle("Zayif Yaratik Avi")
    }
}

struct ZayifView_Previews: PreviewProvider {
    static var previews: some View {
        ZayifView()
    }
}
