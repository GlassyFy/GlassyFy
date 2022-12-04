import SwiftUI

struct RegistroView: View {
    @State private var registroCorrecto = false //Cambiar a false luego para correcta funcionalidad
    @State private var usuario: String = ""
    @State private var clave: String = ""
    @State private var clave2: String = ""
    @State private var correo: String = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                    .ignoresSafeArea()
                VStack{
                    Image("logo_glassyfy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height:300)
                        .padding(-100)
                    
                    //Cambiar el color de los placeholders a blanco
                    VStack{
                        Text("Nombre de usuario")
                            .foregroundColor(.white)
                            .frame(width: 295, height: 42, alignment: .bottomLeading)
                        TextField("Introduzca su nombre de usuario", text: $usuario)
                            .padding()
                            .frame(width: 295, height: 42)
                            .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .autocapitalization(.none)
                    }
                    
                    Text("Contraseña")
                        .foregroundColor(.white)
                        .frame(width: 295, height: 42, alignment: .bottomLeading)
                    TextField("Introduzca su contraseña", text: $clave)
                        .padding()
                        .frame(width: 295, height: 42)
                        .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .autocapitalization(.none)
                    
                    Text("Repita su contraseña")
                        .foregroundColor(.white)
                        .frame(width: 295, height: 42, alignment: .bottomLeading)
                    TextField("Introduzca su contraseña", text: $clave2)
                        .padding()
                        .frame(width: 295, height: 42)
                        .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .autocapitalization(.none)
                    
                    Text("Correo electrónico")
                        .foregroundColor(.white)
                        .frame(width: 295, height: 42, alignment: .bottomLeading)
                    TextField("Introduzca su correo electrónico", text: $correo)
                        .padding()
                        .frame(width: 295, height: 42)
                        .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .autocapitalization(.none)
                    
                    Group {
                        Button("Registrarse"){
                            //Hay que completar la funcionalidad del boton para que añada usuarios a base de datos
                            //una vez que haya validado el registro (contraseñas que coincidan, nombre de usuario
                            //no repetido, correo no repetido, correo con @, contraseña con mayuscula...)
                            
                            //validarRegistro(usuario: usuario, clave: clave, clave2: clave2, correo: correo)
                        }
                        .frame(width: 144 , height: 53)
                        .background(Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding(.top, 20)
                        .disabled(usuario.isEmpty ||  clave.isEmpty ||  clave2.isEmpty || correo.isEmpty)
                        
                        NavigationLink(destination: Text("Registro relizado :D")
                                       ,isActive: $registroCorrecto){
                            EmptyView()
                        }
                        
                        
                        HStack{
                            Text("¿Ya tienes cuenta?")
                                .foregroundColor(Color.white)
                                .font(.footnote)
                                .bold()
                            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                                Text("Inicia sesión aquí")
                                    .foregroundColor(Color(red: 77 / 255, green: 167 / 255, blue: 231 / 255))
                                    .font(.footnote)
                                    .padding()
                                
                            }
                            .offset(x:-15, y:0)
                        }
                    }
                    
                }.frame(width: 296)
                    .offset(x: 0 , y: -50)
                Spacer()
            }
            .navigationBarHidden(true)
        }
//        func validarRegistro(usuario: String, clave: String, clave2: String, correo: String){
//            //Aquí habría que hacer conexión con la base de datos...
//            //Validacion de registro de ejemplo
//            if correo.lowercased() == "admin"{
//                wrongCorreo = 0
//                if clave.lowercased() == "admin"{
//                    wrongClave = 0
//                    acceso = true
//                }else {
//                    wrongClave = 2
//                }
//            }else{
//                wrongCorreo = 2
//            }
//        }
        
    }
}

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView()
    }
}
