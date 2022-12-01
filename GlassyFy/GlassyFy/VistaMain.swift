//
//  VistaMain.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 23/11/22.
//

import SwiftUI

struct VistaMain: View {
    @State var seleccion : Int = 0
    var colorSeleccion: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)
    
    var body: some View {
        TabView(selection: $seleccion){
            NuevoExperimentoView()
                .tabItem{
                    Image(systemName: "signature")
                    Text("Historial")
                }
                .tag(0)
                .background()
//            NuevoExperimentoView()
//                .tabItem{
//                    Image(systemName: "bell")
//                    Text("Nuevo experimento")
//                }
//                .tag(1)
        }
    }
}

struct VistaMain_Previews: PreviewProvider {
    static var previews: some View {
        VistaMain()
    }
}
