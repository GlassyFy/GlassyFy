//
//  VistaEdicionPerfilUsuario.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI


struct VistaEdicionPerfilUsuario: View {
    @EnvironmentObject var vm: ViewModel
    @Binding var usuarioCurrent: UsuarioEntity
    @Binding var nombre: String
    @Binding var email: String
    @Binding var telefono: String
    @Binding var descripcion: String
    @Binding var foto: UIImage
    @Binding var fondo: UIImage
    @Binding var cancelar: Bool
    @State var mostrarCambiarFoto: Bool = false
    @State var mostrarCambiarFondo: Bool = false
    @Environment(\.presentationMode) var modoPresentacion
    var body: some View {
        GeometryReader{gemr in
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea(.all)
        .overlay(
            
                VStack{
                HStack { //Navegacion a VistaPerfilUsuario
                    Button() {
                        cancelar = true
                        modoPresentacion.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(colorRojoTxt)
                    }//.padding()
                    Spacer()
                    
                    Text(usuarioCurrent.nombre!)
                        .frame(alignment: .center) //373
                    
                    Spacer()
                    Button() {
                        cancelar = false
                        modoPresentacion.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(colorGreen)
                    }//.padding()
                    
                } //HStack Navegacion
                .frame(width:gemr.size.width,  height:37, alignment: .center)
                .background(colorRect)
                .font(.custom("Arial", size:24))
                //.padding(.top, -50)

                    ScrollView{
                        VStack {
                            ZStack{
                                Image(uiImage: fondo)
                                        .resizable()
                                        .frame(width:gemr.size.width,  height:gemr.size.height*0.25, alignment: .center)
                                //Aplicamos el sombreado
                                    .overlay(
                                        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                                            .opacity(0.5)
                                    )
                                //Aplicamos la imagen de la camara
                                    .overlay(
                                        Image(systemName: "camera")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .offset(y:-20)
                                            
                                    )
                                    .onTapGesture {
                                        mostrarCambiarFondo.toggle()
                                    }
                                            
                                        
                                        .sheet (isPresented: $mostrarCambiarFondo) {
                                            ImagePicker(sourceType: .photoLibrary) {imagenFondo in
                                                fondo = imagenFondo
                                            }
                                        }
                            }.zIndex(0)
                       
                        VStack {
                            
                            //Se ha integrado el cambiar foto dentro de la propia foto, al hacer click
                            ZStack { //Cambiar Foto
                                Image(uiImage: foto)
                                    .resizable()
                                    .frame(width:gemr.size.width*0.3, height:gemr.size.width*0.3)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(.white, lineWidth: 1)
                                    )
                                //Aplicamos el sombreado
                                    .overlay(
                                        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                                            .clipShape(Circle())
                                            .opacity(0.5)
                                    )
                                //Aplicamos la imagen de la camara
                                    .overlay(
                                        Image(systemName: "camera")
                                            .resizable()
                                            .frame(width: 40, height: 40, alignment: .center)
                                            
                                    )
                                    .onTapGesture {
                                        mostrarCambiarFoto.toggle()
                                    }
                                    .sheet (isPresented: $mostrarCambiarFoto) {
                                        ImagePicker(sourceType: .photoLibrary) {imageSeleccionada in
                                            foto = imageSeleccionada
                                        }
                                    }
                                    .zIndex(3)
                                
//                                Button() {
//                                    mostrarCambiarFoto.toggle()
//                                } label: {
//                                    Image(systemName: "plus.circle")
//                                        .resizable()
//                                        .frame(width: 40, height: 40)
//                                        .offset(x:25, y:0)
//                                        .sheet (isPresented: $mostrarCambiarFoto) {
//                                            ImagePicker(sourceType: .photoLibrary) {imageSeleccionada in
//                                                foto = imageSeleccionada
//                                            }
//                                        }
//                                }
                            }
                        }
                        .frame(width:gemr.size.width*0.95, alignment: .center) //
                        .offset(y:-80) //-100
                        
                            HStack{ 
                                TextField("", text: $nombre)
                                    .frame(width:gemr.size.width*0.95, height: 60, alignment: .center)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size:24))
                                        .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                                        .background(colorRect)
                                        .offset(y: -70)
                                        .onChange(of: self.nombre){ value in
                                            if Int(self.nombre.count) > 20 {
                                                self.nombre = String(value.prefix(20))
                                            }
                                        }

                            }
                        
                            HStack {  //Cambiar email
                                Image(systemName: "envelope.fill")
                                    .padding(.leading, 10)
                                    
                                Text("\(email)")
                                    .foregroundColor(.white)
                                    .frame(height: 32, alignment: .leading)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .multilineTextAlignment(.leading)
                            }
                            .frame(width:gemr.size.width*0.95,  height:60,alignment: .leading) //439
                            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                            .background(colorRect)
                            //.foregroundColor(.white)
                            .font(.custom("Arial", size:28))
                            .offset(y:-60) //
                            .opacity(0.5)
                            
                            HStack { //Cambiar telefono
                                Image(systemName: "phone.fill")
                                    .padding(.leading, 10)
                                    //.foregroundColor(.white)
                                TextField("Tlfno", text: $telefono)
                                    .foregroundColor(.white)
                                    .frame(height: 32, alignment: .leading)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .multilineTextAlignment(.leading)
                            }
                            .frame(width:gemr.size.width*0.95,  height:60, alignment: .leading) //439
                            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                            .background(colorRect)
                            .font(.custom("Arial", size:28))
                            .offset(y:-50)  //-50
                            
                            
                            HStack{
                                Image (systemName: "questionmark.app")
                                    .resizable()
                                    .frame(width: 43, height: 43)
                                    .background(colorRect)
                                    .padding(.leading, gemr.size.width*0.01)
                                Text("  Sobre mí")
                                    .font(.custom("Arial", size:32))
                                Spacer()
                                Text("\(descripcion.count)/150")
                                    .font(.custom("Arial", size:16))
                                    .foregroundColor(colorRojoTxt)
                            }
                            .frame(width:gemr.size.width*0.95,  height:65, alignment: .leading)
                            .offset(y:-40)  //-40
                        
                            TextEditor (text: $descripcion)
                                .frame(width:gemr.size.width*0.95, height: gemr.size.height*0.2, alignment: .leading) //439
                                .clipShape(RoundedRectangle(cornerRadius:10))
                                .onChange(of: self.descripcion) {value in
                                    if Int(descripcion.count) > 150 {
                                        self.descripcion = String(descripcion.prefix(150))
                                    }
                                }
                                .colorMultiply(contrariofondotxt)
                                .foregroundColor(.black)
                                .colorInvert()
                                .fixedSize(horizontal: false, vertical: true)
                                .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                                .offset(y:-40)
                    }
                    }
                    
                } //VStack
                //.frame(width:gemr.size.width*0.) //475x729
                .background(colorFondo)
                .foregroundColor(.white)
                .zIndex(5)
            
            
        ).padding(.leading, -gemr.size.width*0.02)
                .padding(.trailing, -gemr.size.width*0.02)
        }
    }
}
