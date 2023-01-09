//
//  VistaPerfilUsuarioAjeno.swift
//  GlassyFy
//
//  Created by Aula11 on 6/1/23.
//

import SwiftUI

struct VistaPerfilUsuarioAjeno: View {
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
            GeometryReader{ gemr in
                VStack { //Todo
                    
                    Image("kraken")
                        .resizable()
                        .frame(width:gemr.size.width ,height:gemr.size.height*0.25, alignment: .center)
                    
                    //MARK: HSTACK CON CONTENIDO BOTON HISTORICO, FOTO PERFIL Y BOTÓN EDICION
                    HStack{
                        //Spacer()
                        NavigationLink(destination:VistaHistoricoUsuarioAjeno(usuarioCurrent: usuarioCurrent)){
                            Image(systemName: "books.vertical.fill")
                                .resizable()
                                .frame(width: 55, height: 45)
                                .padding(5)
                                .background(colorBlue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.top, 80)
                                .padding(.leading, 40)
                        }
                        
                                                
                        Spacer()
                        //Image(uiImage: foto) //Image(uiImage: UIImage(data: usuarioCurrent.foto!)!)//("foto")
                        Image (uiImage: UIImage(data: usuarioCurrent.foto!) ?? UIImage(systemName: "person.circle.fill")!)
                            .resizable()
                            //.scaledToFit()
                            //.frame(width:234)
                            .frame(width: gemr.size.width*0.3, height: gemr.size.height*0.3, alignment: .center)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .offset(x: -50)
                            
                        Spacer()
                    }//FIN HSTACK.
                    .offset(y: -gemr.size.height*0.15)
                    .frame(width: gemr.size.width, alignment: .center)
                    
                    VStack{
                        //MARK: CONTENIDO INFORMACIÓN USUARIO
                        
                        Text(usuarioCurrent.nombre!)
                            .font(.custom("Arial", size:32))
                            .foregroundColor(.white)
                            //.padding(.bottom, 10)
                            .offset(y: -90)
                        
                        HStack{
                            Image(systemName: "envelope.fill")
                                .padding(.leading, 10)
                            Text(usuarioCurrent.email ?? "42 333 666 999") //email
                            
                        }
                        .frame(width: gemr.size.width*0.95, height: 60, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                        .background(colorRect)
                        .font(.custom("Arial", size:25))
                        .offset(y: -90)
                        
                        HStack{
                            Image(systemName: "phone.fill")
                                .padding(.leading, 10)
                            Text(usuarioCurrent.telefono ?? "42 333 666 999")  //telefono
                        }
                        .frame(width: gemr.size.width*0.95, height: 60, alignment: .leading)
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
                            .padding(.leading, gemr.size.width*0.01)
                
                        Text(" Sobre mí")
                            .font(.custom("Arial", size:32))
                        Spacer()
                    }
                    .frame(height:65, alignment: .leading)
                    .offset(y: -90)

                    ScrollView {
                        Text (usuarioCurrent.descripcion ?? "Nada por ahora :P")
                            .frame(width: gemr.size.width*0.9, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.all, 10)
                            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                            .background(colorRect)
                            .font(.custom("Arial", size:26))
                    }.frame(width: gemr.size.width*0.95, height: gemr.size.height*0.25, alignment: .center)
                            .offset(y:-90)
                        
                        
                        
                        
                } //VStack Todo
                    .frame(width: gemr.size.width*0.95)
                    .background(colorFondo)
                .foregroundColor(.white)
                .offset(y:-50)
                .onAppear(){
                    self.email = usuarioCurrent.email!
                    //self.telefono = usuarioCurrent.telefono! ??
                    telefono = usuarioCurrent.telefono ?? "950 000 000"
                    self.descripcion = usuarioCurrent.descripcion ?? "Nada por ahora macho"
                    if(self.usuarioCurrent.foto == nil){
                        self.foto = UIImage(systemName: "person.circle.fill")!
                    }else{
                        self.foto = UIImage(data: self.usuarioCurrent.foto!)!
                    }
                    //self.foto = UIImage(data: usuarioCurrent.foto!)?? ?? UIImage(systemName: "person.circle.fill")!
                }//.offset(y: 140)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle(usuarioCurrent.nombre!)
            }
                
                    
                    
                    
                    
        )
    }
}
