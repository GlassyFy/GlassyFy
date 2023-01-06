//
//  VistaPerfilUsuarioLogueado.swift
//  GlassyFy
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct VistaPerfilUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity
    @State var email: String = ""
    @State var telefono: String = ""
    @State var descripcion: String = ""
    @State var foto:UIImage
    @State var mostrarEdicion: Bool = false
    @State var cancelar: Bool = true
    
    init(usuarioCurrent: UsuarioEntity) {
            self.usuarioCurrent = usuarioCurrent
        if(self.usuarioCurrent.foto == nil){
            self.foto = UIImage(systemName: "person.circle.fill")!
        }else{
            self.foto = UIImage(data: self.usuarioCurrent.foto!)!
        }
        
        if(self.usuarioCurrent.telefono == nil){
            self.telefono = "+42 333 666 999"
        }else{
            self.telefono = self.usuarioCurrent.telefono!
        }
        
        if(self.usuarioCurrent.descripcion == nil){
            self.descripcion = "Nada por ahora "
        }else{
            self.descripcion = self.usuarioCurrent.descripcion!
        }
        
        }
    
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
        .overlay(
                VStack { //Todo

                    //Aquí va la barra superior, con el nombre y el boton de salir
//                    HStack{
//                        Text(usuarioCurrent.nombre!)
//
//                            .font(.custom("Arial", size:24))
//                            .foregroundColor(.white)
//
//                    }.frame(minWidth: 0, maxWidth: .infinity,minHeight: 0, maxHeight: 50, alignment: .center)
//                        .overlay(
//                            HStack{
//                                NavigationLink(destination: RevisionDatosExp()){
//                                    Text("Salir")
//                                        .frame(width:51)
//                                    .font(.custom("Arial", size:24))
//                                    .padding(.leading)
//                                    .foregroundColor(colorRojoTxt)
//                                }
//
//                                Spacer()
//                            }
//                        )
//                        .background(colorRect)
//                        //.padding(.top, -35)
//                        .zIndex(1)
//                        //.offset(y:20)
                    
                    Image("kraken")
                        .resizable()
                        .frame(height:200, alignment: .center)
                        .offset(y: 150)
                        .padding(.top, -100)
                    
                    
                    VStack{
                        
                        //MARK: HSTACK CON CONTENIDO BOTON HISTORICO, FOTO PERFIL Y BOTÓN EDICION
                        HStack{
                            NavigationLink(destination:VistaHistoricoUsuario(usuarioCurrent: usuarioCurrent)){
                                Image(systemName: "books.vertical.fill")
                                    .resizable()
                                    .frame(width: 55, height: 45)
                                    .padding(5)
                                    .background(colorBlue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .padding(.top, 80)
                            }
                            .navigationBarItems(leading:
                                NavigationLink(destination: RevisionDatosExp()){
                                Text("Salir")
                                    .frame(width:51)
                                .font(.custom("Arial", size:24))
                                .padding(.leading)
                                .foregroundColor(colorRojoTxt)
                            },trailing:
                                                    HStack{
                                Text(usuarioCurrent.nombre!)
                                                
                                .font(.custom("Arial", size:24))
                                .foregroundColor(.white)
                                Spacer()
                            }
                                )
                                                    
                            
                            Image(uiImage: foto) //Image(uiImage: UIImage(data: usuarioCurrent.foto!)!)//("foto")
                                .resizable()
                                //.scaledToFit()
                                //.frame(width:234)
                                .frame(minWidth: 0, maxWidth: 234, minHeight: 0, maxHeight: 234)
                                .clipShape(Circle())
                                //.offset(y: -50)
                                

                            Button() {
                                mostrarEdicion.toggle()
                                email = usuarioCurrent.email!
                                telefono = usuarioCurrent.telefono!
                                descripcion = usuarioCurrent.descripcion ?? "Nada por ahora..."
                                foto = UIImage(data: usuarioCurrent.foto!)!
                            } label: {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 31, height: 32)
                                    .padding(10)
                                    .foregroundColor(colorGreen)
                                    .border(colorGreen, width: 3) //
                                    .cornerRadius(5) //
                                    .padding(.top, 80)
                                    //.offset(y:50)
                                    .sheet (isPresented: $mostrarEdicion,
                                        onDismiss: {
                                            if !cancelar {
                                                usuarioCurrent.email = email
                                                usuarioCurrent.telefono = telefono
                                                usuarioCurrent.descripcion = descripcion
                                                usuarioCurrent.foto = foto.pngData()
                                                vm.guardarDatos()
                                            }
                                        }, content: {
                                            VistaEdicionPerfilUsuario(usuarioCurrent: usuarioCurrent, email: $email, telefono: $telefono,
                                                descripcion: $descripcion, foto: $foto, cancelar: $cancelar)
                                        }
                                    )
                                
                            }
                        }//FIN HSTACK.
                        .offset(y: -90)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        
                        
                        //MARK: CONTENIDO INFORMACIÓN USUARIO
                        
                        Text(usuarioCurrent.nombre!)
                            .font(.custom("Arial", size:32))
                            .foregroundColor(.white)
                            //.padding(.bottom, 10)
                            .offset(y: -90)
                        
                        HStack{
                            Image(systemName: "envelope.fill")
                                .padding(.leading, 10)
                            Text(email)
                            
                        }
                        .frame(width: 380, height: 60, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                        .background(colorRect)
                        .font(.custom("Arial", size:25))
                        .offset(y: -90)
                        
                        HStack{
                            Image(systemName: "phone.fill")
                                .padding(.leading, 10)
                            Text(telefono)
                            
                        }
                        .frame(width: 380, height: 60, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                        .background(colorRect)
                        .font(.custom("Arial", size:25))
                        .offset(y: -90)
                        
                    HStack{  //Sobre mi
                        Image (systemName: "questionmark.app")
                            .resizable()
                            .frame(width: 43, height: 43)
                            .background(colorRect)
                            .foregroundColor(.white)
                
                        Text(" Sobre mí")
                            .font(.custom("Arial", size:32))
                        Spacer()
                    }
                    .frame(height:65, alignment: .leading)
                    .offset(y: -90)

                    ScrollView {
                        Text (descripcion)//Text (usuarioCurrent.descripcion!)
                            .frame(width: 370, alignment: .leading) //419x110
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.all, 10)
                            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                            .background(colorRect)
                            .font(.custom("Arial", size:26))
                    }.frame(width: 370, height: 210, alignment: .center)
                            .zIndex(-1)
                            .offset(y:-90)
                        
                } //VStack Todo
                    .frame(width: 380)
                    .background(colorFondo)
                .foregroundColor(.white)
                .onAppear(){
                    self.email = usuarioCurrent.email!
                    self.telefono = usuarioCurrent.telefono!
                    self.descripcion = usuarioCurrent.descripcion ?? "Nada por ahora macho"
                    self.foto = UIImage(data: usuarioCurrent.foto!)!
                }.offset(y: 140)
                }.navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("")
                    
        )
    }
}

//struct VistaPerfilUsuario_Previews: PreviewProvider {
//    @StateObject private var vm: ViewModel = ViewModel()
//    static var previews: some View {
//        VistaPerfilUsuario
//        VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], foto: UIImage(data: vm.usuariosArray[0].foto!)!)
//
//    }
//}
//

