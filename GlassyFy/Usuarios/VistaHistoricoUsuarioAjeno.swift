//
//  VistaHistoricoUsuarioAjeno.swift
//  GlassyFy
//
//  Created by Aula11 on 6/1/23.
//

import SwiftUI

/*
var colorFondo: Color = Color(red: 48/255, green: 49/255, blue: 54/255)
var colorRect: Color = Color(red: 56/255, green: 57/255, blue: 62/255)
var colorcampostxt: Color = Color(red: 65 / 255, green: 68 / 255, blue: 74 / 255)
var colorBlue: Color = Color(red: 73/255, green: 82/255, blue: 189/255)  //var colorSeleccion
var colorGreen: Color = Color(red: 90/255, green: 163/255, blue: 100/255)
var colorStroke: Color = Color(red: 101/255, green: 101/255, blue: 101/255)
var colorLabel: Color = Color(red: 150/255, green: 152/255, blue: 157/255)
var colorRojoTxt: Color = Color(red: 199/255, green: 73/255, blue: 69/255) //var colorSalir
var colorRojoBoton: Color = Color(red: 237/255, green: 106/255, blue: 94/255) //var colorBTNSi
*/

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
                        .environment(\.defaultMinListRowHeight, 50)
                    }
                }// VStack
                .frame(width:gemr.size.width,  height:gemr.size.height, alignment: .top)
            }.navigationTitle("Historico de \(usuarioCurrent.nombre!)")
                
        )
    } // body
}
