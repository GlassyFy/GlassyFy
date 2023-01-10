//
//  VistaPerfilUsuarioLogueado.swift
//  GlassyFy
//
//  Created by Aula11 on 18/11/22.
//
import SwiftUI

struct VistaPerfilUsuario: View {
    @EnvironmentObject var vm: ViewModel
    @Binding var acceso: Bool
    @Binding var usuarioCurrent: UsuarioEntity
    @State var email: String = ""
    @State var telefono: String = ""
    @State var descripcion: String = ""
    @State var foto:UIImage = UIImage(systemName: "person.circle.fill")! //@State var foto:UIImage
    @State var mostrarEdicion: Bool = false
    @State var cancelar: Bool = true
    @State var fondo:UIImage = UIImage(named: "kraken")!
    
    /*init(usuarioCurrent: UsuarioEntity) {
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
    }*/
    
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
        .overlay(
            GeometryReader{ gemr in
                VStack { //Todo
                    
                    Image(uiImage: fondo)
                        .resizable()
                        .frame(width:gemr.size.width ,height:gemr.size.height*0.25, alignment: .center)
                    
                    //MARK: HSTACK CON CONTENIDO BOTON HISTORICO, FOTO PERFIL Y BOTÓN EDICION
                    HStack{
                        Spacer()
                        NavigationLink(destination:VistaHistoricoUsuario(usuarioCurrent: $usuarioCurrent)){
                            Image(systemName: "books.vertical.fill")
                                .resizable()
                                .frame(width: 55, height: 45)
                                .padding(5)
                                .background(colorBlue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.top, 95)
                        }
                        
                                                
                        Spacer()
                        //Image(uiImage: foto) //Image(uiImage: UIImage(data: usuarioCurrent.foto!)!)//("foto")
                        Image (uiImage: UIImage(data: usuarioCurrent.foto!) ?? UIImage(systemName: "person.circle.fill")!)
                            .resizable()
                            .frame(width:gemr.size.width*0.3, height:gemr.size.width*0.3)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(.white, lineWidth: 1)
                            )
                        Spacer()
                        
                        Button() {
                            mostrarEdicion.toggle()
                            email = usuarioCurrent.email!
                            telefono = usuarioCurrent.telefono!
                            descripcion = usuarioCurrent.descripcion ?? "Nada por ahora :P"
                            foto = UIImage(data: usuarioCurrent.foto!)!
                            fondo = UIImage (data: usuarioCurrent.fondo!)!
                            
                        } label: {
                            HStack{
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 31, height: 31)
                                    .padding(5)
                                    //.background(colorFondo)
                                    .foregroundColor(colorGreen)
                            }.frame(width: 55, height: 55)
                                .background(colorFondo)
                                .border(colorGreen, width: 3) //
                                .cornerRadius(5) //
                                .padding(.top, 95)
                                //.offset(y:50)
                                .sheet (isPresented: $mostrarEdicion,
                                    onDismiss: {
                                        if !cancelar {
                                            usuarioCurrent.email = email
                                            usuarioCurrent.telefono = telefono
                                            usuarioCurrent.descripcion = descripcion
                                            usuarioCurrent.foto = foto.pngData()
                                            usuarioCurrent.fondo = fondo.pngData()
                                            vm.guardarDatos()
                                        }
                                    }, content: {
                                        VistaEdicionPerfilUsuario(usuarioCurrent: $usuarioCurrent, email: $email, telefono: $telefono,
                                                                  descripcion: $descripcion, foto: $foto, fondo: $fondo, cancelar: $cancelar)
                                    }
                                )
                            
                        }
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
                            .offset(y: -gemr.size.height*0.15)
                        
                        HStack{
                            Image(systemName: "envelope.fill")
                                .padding(.leading, 10)
                            Text(usuarioCurrent.email ?? "42 333 666 999") //email
                            
                        }
                        .frame(width: gemr.size.width*0.95, height: 60, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                        .background(colorRect)
                        .font(.custom("Arial", size:25))
                        .offset(y: -gemr.size.height*0.15)
                        
                        HStack{
                            Image(systemName: "phone.fill")
                                .padding(.leading, 10)
                            Text(usuarioCurrent.telefono ?? "42 333 666 999")  //telefono
                        }
                        .frame(width: gemr.size.width*0.95, height: 60, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                        .background(colorRect)
                        .font(.custom("Arial", size:25))
                        .offset(y: -gemr.size.height*0.15)
                        
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
                    .offset(y: -gemr.size.height*0.15)

                    ScrollView {
                        Text (usuarioCurrent.descripcion ?? "Nada por ahora :P")
                            //.frame(width: gemr.size.width*0.9, alignment: .leading)
                            .padding()
                            .multilineTextAlignment(.leading)
                        
                    }.frame(width: gemr.size.width*0.95)
                            .frame(maxHeight: gemr.size.height*0.3)
                            .fixedSize(horizontal: false, vertical: true)
                            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                            .background(colorRect)
                            .font(.custom("Arial", size:20))
                            .offset(y: -gemr.size.height*0.15)
                       
                } //VStack Todo
                    .frame(width: gemr.size.width*0.95)
                    .background(colorFondo)
                .foregroundColor(.white)
                //.offset(y:-80)
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
                    fondo = UIImage(data: self.usuarioCurrent.fondo!)!
                    //self.foto = UIImage(data: usuarioCurrent.foto!)?? ?? UIImage(systemName: "person.circle.fill")!
                }//.offset(y: 140)
                }.navigationBarItems(leading:
                                        
                                        Button("Salir"){
                                            acceso = false
                                        }
                                            .frame(width:51)
                                        .font(.custom("Arial", size:24))
                                        .padding(.leading)
                                        .foregroundColor(colorRojoTxt)
                                    /*,trailing:
                                                            HStack{
                                        Text(usuarioCurrent.nombre!)
                                                        
                                        .font(.custom("Arial", size:24))
                                        .foregroundColor(.white)
                                        Spacer()
                                    }*/
                                        )
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle(usuarioCurrent.nombre!)
            }
                
                    
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
