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
            Section {
                Text("Savas")
            }
         
            .navigationTitle("Savas")
        }
    }
}

struct SavasView_Previews: PreviewProvider {
    static var previews: some View {
        SavasView()
    }
}
