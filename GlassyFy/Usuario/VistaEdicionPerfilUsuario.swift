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
    @Binding var email: String
    @Binding var telefono: String
    @Binding var descripcion: String
    @Binding var foto: UIImage
    @Binding var fondo: UIImage
    @Binding var cancelar: Bool
    @State var mostrarCambiarFoto: Bool = false
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
                        
                        Image(uiImage: fondo)
                                .resizable()
                                .frame(width:gemr.size.width,  height:gemr.size.height*0.25, alignment: .center)
                                .onTapGesture {
                                    mostrarCambiarFoto.toggle()
                                }
                                .sheet (isPresented: $mostrarCambiarFoto) {
                                    ImagePicker(sourceType: .photoLibrary) {imageSeleccionada in
                                        fondo = imageSeleccionada
                                    }
                                }

                        VStack {
                            
                            //Se ha integrado el cambiar foto dentro de la propia foto, al hacer click
                            HStack { //Cambiar Foto
                                Image(uiImage: foto) //Image(uiImage: UIImage(data: usuarioCurrent.foto!)!)//("foto")
                                    .resizable()
                                    //.scaledToFit()
                                    .frame(width:gemr.size.width*0.3, height:gemr.size.width*0.3)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(.white, lineWidth: 1))
                                    .onTapGesture {
                                        mostrarCambiarFoto.toggle()
                                    }
                                    .sheet (isPresented: $mostrarCambiarFoto) {
                                        ImagePicker(sourceType: .photoLibrary) {imageSeleccionada in
                                            foto = imageSeleccionada
                                        }
                                    }
                                
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
                        
                        Text(usuarioCurrent.nombre!)
                            .frame(width:439,  height:44, alignment: .center)
                            .font(.custom("Arial", size:36))
                            .offset(y:-70)

                            HStack {  //Cambiar email
                                Image(systemName: "envelope.fill")
                                    //.foregroundColor(.white)
                                TextField("Email", text: $email)
                                    .foregroundColor(.white)
                                    .frame(height: 32, alignment: .leading)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            .frame(width:gemr.size.width*0.95,  height:60, alignment: .leading) //439
                            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                            .background(colorRect)
                            //.foregroundColor(.white)
                            .font(.custom("Arial", size:28))
                            .offset(y:-60) //
                            
                            HStack { //Cambiar telefono
                                Image(systemName: "phone.fill")
                                    //.foregroundColor(.white)
                                TextField("Tlfno", text: $telefono)
                                    .foregroundColor(.white)
                                    .frame(height: 32, alignment: .leading)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
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
            
            
        ).padding(.leading, -gemr.size.width*0.02)
                .padding(.trailing, -gemr.size.width*0.02)
        }
    }
}
