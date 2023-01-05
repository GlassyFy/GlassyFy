import SwiftUI

struct RegistroView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var vm: ViewModel
    @State private var usuarioCurrent: UsuarioEntity = UsuarioEntity()
    @State private var registroCorrecto = false
    @State private var usuario: String = ""
    @State private var clave: String = ""
    @State private var clave2: String = ""
    @State private var correo: String = ""
    @State private var aviso: String = "" //Muestra mensajes de aviso
    //Variables para controlar overlay() rojo en los campos
    @State private var wrongUsuario = 0
    @State private var wrongClave = 0
    @State private var wrongCorreo = 0
    
    //Falta implementar restricciones para establecer una contraseña segura
    var body: some View {
        ZStack{
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .ignoresSafeArea()
            VStack{
                Image("logo_glassyfy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height:300)
                    .padding(-100)
                VStack{
                    Text("Nombre de usuario")
                        .foregroundColor(.white)
                        .frame(width: 295, height: 42, alignment: .bottomLeading)
                    TextField("", text: $usuario)
                        .placeholder(Text("Introduzca su nombre de usuario")
                            .foregroundColor(.white), show: usuario.isEmpty)
                        .padding()
                        .frame(width: 295, height: 42)
                        .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .autocapitalization(.none)
                        .overlay(
                              RoundedRectangle(cornerRadius: 10)
                                  .stroke(.red, lineWidth: CGFloat(wrongUsuario))
                          )
                }
                
                Text("Contraseña")
                    .foregroundColor(.white)
                    .frame(width: 295, height: 42, alignment: .bottomLeading)
                SecureField("", text: $clave)
                    .placeholder(Text("Introduzca su contraseña")
                        .foregroundColor(.white), show: clave.isEmpty)
                    .padding()
                    .frame(width: 295, height: 42)
                    .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .autocapitalization(.none)
                    .overlay(
                          RoundedRectangle(cornerRadius: 10)
                              .stroke(.red, lineWidth: CGFloat(wrongClave))
                      )
                
                Text("Repita su contraseña")
                    .foregroundColor(.white)
                    .frame(width: 295, height: 42, alignment: .bottomLeading)
                SecureField("", text: $clave2)
                    .placeholder(Text("Introduzca su contraseña")
                        .foregroundColor(.white), show: clave2.isEmpty)
                    .padding()
                    .frame(width: 295, height: 42)
                    .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .autocapitalization(.none)
                    .overlay(
                          RoundedRectangle(cornerRadius: 10)
                              .stroke(.red, lineWidth: CGFloat(wrongClave))
                      )
                
                Text("Correo electrónico")
                    .foregroundColor(.white)
                    .frame(width: 295, height: 42, alignment: .bottomLeading)
                TextField("Introduzca su correo electrónico", text: $correo)
                    .placeholder(Text("Introduzca su correo electrónico")
                        .foregroundColor(.white), show: correo.isEmpty)
                    .padding()
                    .frame(width: 295, height: 42)
                    .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .autocapitalization(.none)
                    .overlay(
                          RoundedRectangle(cornerRadius: 10)
                              .stroke(.red, lineWidth: CGFloat(wrongCorreo))
                      )
                    .onSubmit{
                        wrongClave = 0; wrongCorreo = 0; wrongUsuario = 0;
                        registrarUsuario()
                    }
                
                Group {
                    Text(aviso)
                        .foregroundColor(.red)
                        .font(.footnote)
                    
                    Button("Registrarse"){
                        wrongClave = 0; wrongCorreo = 0; wrongUsuario = 0;
                        registrarUsuario()
                    }
                    .frame(width: 144 , height: 53)
                    .background(Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.top, 20)
                    .disabled(usuario.isEmpty ||  clave.isEmpty ||  clave2.isEmpty || correo.isEmpty)
                    .opacity(usuario.isEmpty ||  clave.isEmpty ||  clave2.isEmpty || correo.isEmpty ? 0.5 : 1.0)
                    .fullScreenCover(isPresented: $registroCorrecto) {
                        VistaMain().environmentObject(vm)
                    }
//                    .sheet(isPresented: $registroCorrecto, onDismiss: {registroCorrecto = false}, content: {
//                        ZStack{
//                            Color.blue.ignoresSafeArea()
//                            Text("¡Registro realizado :D!")
//                        }
//                    })
                    
                    HStack{
                        Text("¿Ya tienes cuenta?")
                            .foregroundColor(Color.white)
                            .font(.footnote)
                            .bold()
                        Button("Inicia sesión aquí"){
                            self.presentation.wrappedValue.dismiss()
                        }
                        .foregroundColor(Color(red: 77 / 255, green: 167 / 255, blue: 231 / 255))
                        .font(.footnote)
                        .padding()
                        .offset(x:-15, y:0)
                    }
                }
                
                Text("GlassyFy 2022")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 10, alignment:.bottom)
                    .offset(x:0, y: 100)
            }.frame(width: 296)
                .offset(x: 0 , y: -50)
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
    
    func usuarioExistente(currentUser: String) -> Bool {
        for usuario in vm.usuariosArray{
            if(usuario.nombre == currentUser){
                return true
            }
        }
        return false
        
    }
    func correoExistente(currentCorreo: String) -> Bool {
        for usuario in vm.usuariosArray{
            if(usuario.email == currentCorreo){
                return true
            }
        }
        return false
    }
    
    func validarFormatoCorreo(currentCorreo: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: currentCorreo)
    }
    
    func textoAviso(tipoError: Int16){
        switch(tipoError){
        case 1:
            aviso = "El usuario ya está en uso. Pruebe con otro o inicie sesión"
        case 2:
            aviso = "El correo electrónico ya existe"
        case 3:
            aviso = "Las contraseñas no coinciden"
        case 4:
            aviso = "El formato de correo electrónico no es válido"
        default:
            aviso = ""
        }
    }
    
    func registrarUsuario(){
        if(usuarioExistente(currentUser: usuario)) {
            textoAviso(tipoError: 1)
            wrongUsuario = 1
        }else if(clave != clave2){
            textoAviso(tipoError: 3)
            wrongClave = 1
        }else if(correoExistente(currentCorreo: correo)){
            textoAviso(tipoError: 2)
            wrongCorreo = 1
        }else if(!validarFormatoCorreo(currentCorreo: correo)){
            textoAviso(tipoError: 4)
            wrongCorreo = 1
        }else {
            vm.registrarUsuario(nombre: usuario, contrasena: clave, email: correo.lowercased())
            registroCorrecto = true
            usuarioCurrent = vm.usuariosArray.last!
            aviso = ""
            usuario = ""
            clave = ""
            clave2 = ""
            correo = ""
        }
    }
}



struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView()
    }
}

