//
//  InicioView.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct InicioView: View {
    var body: some View {
        ZStack{
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255).ignoresSafeArea()
            VStack{
                Image("logo_glassyfy")
                    .resizable()
                    .frame(width: 400, height:300)
                    .opacity(0.5)
                    
            }
        }
    }
}

struct InicioView_Previews: PreviewProvider {
    static var previews: some View {
        InicioView()
    }
}
