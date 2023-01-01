import SwiftUI

struct LoginView: View {
    @EnvironmentObject var vm: ViewModel  //PROPUESTA DE ÁNGEL
    var usuarioCurrent: UsuarioEntity = vm.usuariosArray[0] //PROPUESTA DE ÁNGEL

    @State private var correo: String = ""
    @State private var clave: String = ""
    @State private var wrongCorreo = 0
    @State private var wrongClave = 0
    @State private var acceso = false
    //var iconClick = true //Implementar funcionalidad para un icono que muestre o no la contraseña
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
                
                Text("Correo electrónico")
                    .frame(width: 295, height: 42, alignment: .bottomLeading)
                    .foregroundColor(.white)
                
                TextField("", text: $correo)
                    .placeholder(Text("Introduzca su correo electrónico")
                        .foregroundColor(.white),show: correo.isEmpty)
                    .autocapitalization(.none)
                    .padding()
                    .frame(width: 295, height: 42)
                    .foregroundColor(.white)
                    .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .border(.red, width: CGFloat(wrongCorreo))
                
                
                Text("Contraseña")
                    .frame(width: 295, height: 42, alignment: .bottomLeading)
                    .foregroundColor(.white)
                
                SecureField("", text: $clave)
                    .placeholder(Text("Introduzca su contraseña")
                        .foregroundColor(.white),show: clave.isEmpty)
                    .autocapitalization(.none)
                    .padding()
                    .frame(width: 295, height: 42)
                    .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .border(.red, width: CGFloat(wrongClave))
                //Avisos a implementar:
                //-El campo usuario está vacío o el campo contraseña está vacío,
                //-Campos no coinciden con la base de datos (usuario o contraseña incorrectos)
                
                
                Button("Entrar"){
                    //Autenticación del usuario... Hay que conectar con base de datos
                    //Conexión de ejemplo
                    autenticarUsuario(correo: correo, clave: clave)
                }
                .foregroundColor(.white)
                .frame(width: 144 , height: 53)
                .background(Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.top, 40)
                .disabled(correo.isEmpty || clave.isEmpty)
                .opacity(correo.isEmpty || clave.isEmpty ? 0.5 : 1.0 )
                
                NavigationLink(destination: Text("Acceso a la app realizado :D"),
                               isActive: $acceso){
                    //EmptyView()
                    VistaMain(usuarioCurrent: usuarioCurrent).environmentObject(ViewModel()) //PROPUESTA DE ÁNGEL
                }
                
                HStack{
                    Text("¿Aún no tienes cuenta?")
                        .foregroundColor(Color.white)
                        .font(.footnote)
                        .bold()
                    NavigationLink(destination: RegistroView()
                        //.animation(.easeInOut(duration: 0.5))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)) {
                            Text("Regístrate aquí")
                                .foregroundColor(Color(red: 77 / 255, green: 167 / 255, blue: 231 / 255))
                                .font(.footnote)
                                .padding()
                            
                        }
                        .offset(x:-15, y:0)
                        
                }
                Text("GlassyFy 2022")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 10, alignment:.bottom)
                    .offset(x:0, y: 270)
            }
            .padding()
            .offset(x: 0 , y: -130)
            Spacer()
        }
        .navigationBarHidden(true)
    }
    func autenticarUsuario(correo: String, clave: String){
        //Aquí habría que hacer conexión con la base de datos...
        //Usuario y contraseña de ejemplo
        ForEach(vm.usuariosArray){usuario in  //PROPUESTA DE ÁNGEL
            //if correo.lowercased() == usuario.nombre{
            if correo.lowercased() == usuario.email{
                wrongCorreo = 0
                if clave.lowercased() == usuario.contrasena{
                    wrongClave = 0
                    acceso = true
                    usuarioCurrent = usuario
                    break
                }else {
                    wrongClave = 2
                }
            }else{
                wrongCorreo = 2
            }
        } // ForEach

        /*if correo.lowercased() == "admin"{
            wrongCorreo = 0
            if clave.lowercased() == "admin"{
                wrongClave = 0
                acceso = true
            }else {
                wrongClave = 2
            }
        }else{
            wrongCorreo = 2
        }*/      
    }
}

//Struct que implementa el protocolo ViewModifier que nos permite realizar modificaciones
//sobre el propio TextField par incluirle una vista personalizada que simulará un placeholder
struct CustomPlaceholder<T: View>: ViewModifier {
    var placeholder: T
    var show: Bool
    
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if show {
                placeholder
            }
            content
        }
    }
}
//Extensión de View para "setear" una instancia de CustomPlaceholder
extension View {
    func placeholder<T: View>(_ view: T, show: Bool) -> some View {
        self
            .modifier(CustomPlaceholder(placeholder: view, show: show))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
