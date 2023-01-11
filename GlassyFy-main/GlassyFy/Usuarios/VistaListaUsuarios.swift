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
//                        HStack{
//                            Text("Usuarios")
//                                .frame(width:373, alignment: .center)
//                                .foregroundColor(.white)
//                        }
//                        .frame(width:475,  height:37, alignment: .center)
//                        .background(colorRect)
//                        .font(.custom("Arial", size:24))
//                        .zIndex(3)

                        
                        BusquedaUsuarioView(text: $query)  //llama a la subvista para BARRA DE BÚSQUEDA
                            //.frame(width: 350)
                            .padding(.leading, 10)
                            .zIndex(1)
                        
                        //Spacer()
                        VStack{
                            List(){
                                ForEach(vm.usuariosArray){usuario in
                                    if (query.isEmpty || usuario.nombre!.contains(query)) {
                                        VistaFilaUsuario(usuarioCurrent: usuario)
//                                            .swipeActions {
//                                                    Button(role: .destructive) {
//                                                        itemToDelete = usuario
//                                                        showingDeleteAlert = true
//                                                    } label: {
//                                                        Image(systemName: "trash.circle.fill")
//                                                            .resizable()
//                                                            .background(colorFondo)
//                                                            .foregroundColor(colorRojoTxt)
//                                                            .clipShape(Circle())
//                                                            //.frame(width: 70, height: 70)
//                                                    }
//                                            }
//                                            .alert(isPresented:$showingDeleteAlert) {
//                                                Alert(
//                                                    title: Text("¿Seguro desea eliminar el usuario?"),
//                                                    message: Text(itemToDelete!.nombre!),
//                                                    primaryButton: .destructive(Text("Sí").bold()) {
//                                                        vm.deleteUsuario(usuario: itemToDelete!)
//                                                    },
//                                                    secondaryButton: .cancel(Text("No").bold())
//                                                )
//                                            }
                                    }  //if
                                }.listRowBackground(colorFondo) // ForEach
                                
                            }// List
                            .environment(\.defaultMinListRowHeight, 50)
                            
                            
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
                            .opacity(text.isEmpty ? 0.4 : 2.0)
                            .padding(5)
                            .frame(width: 30, height: 30)
                            .foregroundColor(text.isEmpty ? Color(UIColor.gray).opacity(0.4) : Color(UIColor.gray).opacity(0.9))
                        TextField("Buscar usuario...", text:$text)
                            .font(.custom("Arial", size:24))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .autocapitalization(.none)
                        Button(){
                            text = ""
                        }label:{
                            Image(systemName: "x.circle")
                                .padding(5)
                                .foregroundColor(text.isEmpty ? Color(UIColor.white).opacity(0.0) : Color(UIColor.red).opacity(2.0))
                        }
                        .opacity(text.isEmpty ? 0.0 : 1.0)   // Desaparece o aparece el botón
                    } //HStack
                    
                    //.frame(width: 409, height: 50, alignment:.center)
                    .background(colorRect)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                    .frame(width: gemr.size.width*0.9, height: 35, alignment: .center)
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
                                    .frame(width: 35, height: 35)
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
                .frame(height: 40 ,alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(colorStroke, lineWidth: 1))
                        .background(colorRect)
                        .foregroundColor(.white)
            ).navigationBarTitleDisplayMode(.inline)
        }
        
    }
}
