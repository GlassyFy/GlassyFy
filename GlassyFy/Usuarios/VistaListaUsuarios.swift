//
//  VistaListaUsuarios.swift
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
var contrariofondotxt: Color = Color(red: 190 / 255, green: 187 / 255, blue: 181 / 255)
*/

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
                            
                            
                        }.zIndex(0)
                            .frame(width:gemr.size.width, height:gemr.size.height*0.95, alignment: .center)

                        
                        //.colorMultiply(Color(red: 127 / 255, green: 127 / 255, blue: 127 / 255))
                        
                        
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
                            .frame(width: 30, height: 30)
                            .foregroundColor(text.isEmpty ? Color(UIColor.gray).opacity(0.4) : Color(UIColor.gray).opacity(0.9))
                        TextField("Buscar usuario...", text:$text)
                            .font(.custom("Arial", size:24))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                        Button(){
                            text = ""
                        }label:{
                            Image(systemName: "x.circle")
                        }
                        .opacity(text.isEmpty ? 0.0 : 1.0)   // Desaparece o aparece el botón
                    } //HStack
                    
                    //.frame(width: 409, height: 50, alignment:.center)
                    .background(colorRect)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                    .frame(width: gemr.size.width, height: 35, alignment: .center)
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
                                    .frame(width: 31, height: 31)
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
                .frame(/*width: gemr.size.width,*/ height: 37 ,alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(colorStroke, lineWidth: 1))
                        .background(colorRect)
                        .foregroundColor(.white)
            ).navigationBarTitleDisplayMode(.inline)
        }
        
    }
}
