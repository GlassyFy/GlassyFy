//
//  VistaHistorico.swift
//  GlassyFy
//
//  Created by Aula11 on 09/01/23.
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

struct VistaHistorico: View {
    @EnvironmentObject var vm: ViewModel
    //var usuarioCurrent: UsuarioEntity 
    @State var query: String = ""
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea()
        .overlay(
                VStack {
                    HStack{
                        Text("Histórico")
                            .frame(width:373, alignment: .center)
                            .foregroundColor(.white)
                    }
                    .frame(width:475,  height:37, alignment: .center)
                    .background(colorRect)
                    .font(.custom("Arial", size:24))
                    .zIndex(3)
                    
                    BusquedaView(text: $query)  //llama a la subvista para BARRA DE BÚSQUEDA
                        .frame(width: 350)
                    ZStack{
                        List(){
                            ForEach(vm.experimentosArray){experimento in
                                if (query.isEmpty || experimento.nombre!.contains(query)) {
                                    VistaFilaHistorico(experimentoCurrent: experimento)
                                }  //if
                            }.listRowBackground(colorFondo) // ForEach
                        }// List
                        
                        .frame(width:455,  height:649, alignment: .center)
                    }                    
                }// VStack                
                .frame(width:455,  height:769, alignment: .top)
        )
    } // body
}

struct VistaFilaHistorico: View {
    @EnvironmentObject var vm: ViewModel
    //var usuarioCurrent: UsuarioEntity  //¿?
    var experimentoCurrent: ExperimentoEntity
    var body: some View {
        GeometryReader{ gemr in
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
            HStack {
                    //NavigationLink (destination: VistaExperimentoUsuario(usuarioCurrent: usuarioCurrent, experimentoCurrent: experimentoCurrent)) {
                    NavigationLink (destination: VistaExperimentoUsuario(usuarioCurrent: experimentoCurrent.usuariosRelation, experimentoCurrent: experimentoCurrent)) {
                        Image(systemName: "books.vertical.fill")
                            .resizable()
                            .frame(width: 37, height: 31)
                            .padding(5)  //spacing
                            .background(colorBlue)
                            .cornerRadius(10)
                            .offset(x:10, y:0)
                    }
                    VStack{
                        Text(experimentoCurrent.nombre!)  
                                .font(.custom("Arial", size:20))
                        HStack {
                                Text("Autor: \(experimentoCurrent.usuariosRelation.nombre!)")
                                Text("Fecha Creación: \(experimentoCurrent.fechaCreacion!.formatted(.dateTime.day().month().year()))")
                        }
                        .font(.custom("Arial", size:14))
  
                    }
                    .frame(minHeight: 0, idealHeight: 50, maxHeight: .infinity, alignment: .leading)
                    //.frame(height:40, alignment: .leading) //width: 189,
                    .offset(x:5, y:0)
                Spacer()
            } //HStak
                .frame(width: gemr.size.width, alignment: .leading)
            
            //.frame(width:389,  height:40, alignment: .leading)// alignment: .center) //389 // 439x65
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(colorStroke, lineWidth: 1))
            .background(colorRect)
            .foregroundColor(.white)
            )
        }
    }
}