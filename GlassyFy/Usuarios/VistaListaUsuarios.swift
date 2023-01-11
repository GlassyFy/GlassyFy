//
//  VistaListaUsuarios.swift
//  GlassyFy
//
//  Created by Aula11 on 6/1/23.
//

import SwiftUI

struct VistaListaUsuarios: View {
    @EnvironmentObject var vm: ViewModel
    //var usuarioCurrent: UsuarioEntity //= usuario
    @State var query: String = ""
    @State private var showingDeleteAlert = false
    @State private var itemToDelete: UsuarioEntity? = nil
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea()
        .overlay(
            GeometryReader{ gemr in
                Spacer()
                    VStack {
//

                        HStack{
                            BusquedaUsuarioView(text: $query)
                                .frame(width: gemr.size.width*0.9)
//                                .padding(.leading, 10)
//                                .zIndex(1)
                        }.frame(height: gemr.size.height*0.1)
                        
                        
                        //Spacer()
                        VStack{
                            List(){
                                ForEach(vm.usuariosArray){usuario in
                                    if (query.isEmpty || usuario.nombre!.lowercased().starts(with: query.lowercased())) {
                                        VistaFilaUsuario(usuarioCurrent: usuario)
                                    }  //if
                                }.listRowBackground(colorFondo) // ForEach
                                
                            }// List
                            .environment(\.defaultMinListRowHeight, 60)
                            
                            
                        }.zIndex(0)
                            .frame(width:gemr.size.width, height:gemr.size.height*0.95, alignment: .center)

                        
                        
                        
                        
                    }// VStack
                    
                        .frame(width:gemr.size.width*0.99,  height:gemr.size.height, alignment: .top)
                    .navigationTitle("Usuarios")
                
            
        }//.offset(y:50)
        )
    } // body
}

struct BusquedaUsuarioView: View {   // Subvista BARRA DE BÚSQUEDA   EJERCICIO 2
    @Binding var text: String
    @EnvironmentObject var vm: ViewModel // No se si esta bien
    var body: some View {
        GeometryReader{ gemr in
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
                VStack {
                    HStack{
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(text.isEmpty ? Color(UIColor.gray).opacity(0.4) : Color(UIColor.gray).opacity(0.9))
                            .padding(.leading, 5)
                        TextField("Buscar usuario...", text:$text)
                            .font(.custom("Arial", size:24))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .autocapitalization(.none)
                        Button(){
                            text = ""
                        }label:{
                            Image(systemName: "x.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.red)
                                .padding(.trailing,5)
                        }
                        .opacity(text.isEmpty ? 0.0 : 1.0)   // Desaparece o aparece el botón
                    } //HStack
                    .frame(width: gemr.size.width, height: 40, alignment: .center)
                    
                    //.frame(width: 409, height: 50, alignment:.center)
                    .background(colorRect)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                    //.frame(width: gemr.size.width*0.9, height: 35, alignment: .center)
                }
                    
            ).offset(y:10)
        }
        
    }
}

struct VistaFilaUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity  //¿?
    //var experimentoCurrent: ExperimentoEntity
    var body: some View {
        GeometryReader{ gemr in
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
                NavigationLink (destination: VistaPerfilUsuarioAjeno(usuarioCurrent: usuarioCurrent)) {
                    HStack {
                                //Image(systemName: "books.vertical.fill")
                        Image (uiImage: UIImage(data: usuarioCurrent.foto!) ?? UIImage(systemName: "person.circle.fill")!)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(.white, lineWidth: 1))
                                    .padding()
                        
                        if (usuarioCurrent.nombre != nil) {
                            Text(usuarioCurrent.nombre!)  //Tras eliminar, experimentoCurrent.nombre = nil
                                .font(.custom("Arial", size:20))
                            }
                            
                        Spacer()
                    }
                } //HStak
                .frame(height: 50 ,alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(colorStroke, lineWidth: 1))
                        .background(colorRect)
                        .foregroundColor(.white)
            ).navigationBarTitleDisplayMode(.inline)
        }
        
    }
}
