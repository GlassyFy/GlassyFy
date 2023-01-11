//
//  VistaHistoricoUsuarioAjeno.swift
//  GlassyFy
//
//  Created by Aula11 on 6/1/23.
//

import SwiftUI



struct VistaHistoricoUsuarioAjeno: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity //= usuario
    @State var query: String = ""
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea()
        .overlay(
            GeometryReader{ gemr in
                VStack {
//                    HStack{
//                        Text("Histórico de \(usuarioCurrent.nombre!)")
//                            .frame(width:373, alignment: .center)
//                            .foregroundColor(.white)
//                    }
//                    .frame(width:475,  height:37, alignment: .center)
//                    .background(colorRect)
//                    .font(.custom("Arial", size:24))
//                    .zIndex(3)

                    BusquedaView(text: $query)  //llama a la subvista para BARRA DE BÚSQUEDA
                        .frame(width: gemr.size.width*0.85)
                    ZStack{
                        List(){
                            ForEach(vm.experimentosArray){experimento in
                                if (experimento.usuariosRelation==usuarioCurrent && (query.isEmpty || experimento.nombre!.contains(query))) {
                                    VistaFilaHistoricoUsuario(usuarioCurrent: usuarioCurrent, experimentoCurrent: experimento)
                                }  //if
                            }.listRowBackground(colorFondo) // ForEach
                        }// List
                        .frame(height:gemr.size.height*0.9, alignment: .center)
                        .environment(\.defaultMinListRowHeight, 60)
                    }
                }// VStack
                .frame(width:gemr.size.width,  height:gemr.size.height, alignment: .top)
            }.navigationTitle("Historico de \(usuarioCurrent.nombre!)")
                
        )
    } // body
}
