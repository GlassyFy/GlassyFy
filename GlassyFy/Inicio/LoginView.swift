import SwiftUI

struct LoginView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var correo: String = ""
    @State private var clave: String = ""
    @State private var wrongCorreo = 0
    @State private var wrongClave = 0
    @State private var acceso = false
    @State private var aviso: String = ""
    @State private var currentUsuario: String = ""
    //var iconClick = true //Falta implementar funcionalidad para un icono que visibilice o no la contraseña
    //Falta poner bordes redondos rojos si falla correo o clave
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
                
                Text (aviso)
                    .foregroundColor(.red)
                    .font(.footnote)
                Button("Entrar"){
                    autenticarUsuario(correo: correo, clave: clave)
                    if(acceso == true){
                        wrongClave = 0
                        wrongCorreo = 0
                        aviso = ""
                        correo = ""
                        clave = ""
                    }
                    else{
                        wrongCorreo = 2
                        wrongClave = 2
                        aviso = "Correo electrónico o contraseña incorrectos"
                    }
                }
                .foregroundColor(.white)
                .frame(width: 144 , height: 53)
                .background(Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.top, 40)
                .disabled(correo.isEmpty || clave.isEmpty)
                .opacity(correo.isEmpty || clave.isEmpty ? 0.5 : 1.0 )
                .sheet(isPresented: $acceso, onDismiss: {acceso = false}, content: {
                    ZStack{
                        Color.green.ignoresSafeArea()
                        Text("¡Bienvenido \(currentUsuario) :D!")
                    }
                })
                
                //NavigationLink(destination: Text("Acceso a la app realizado :D"),
                //      isActive: $acceso){
                //         EmptyView()
                //      }
                
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
        for usuario in vm.usuariosArray {
            if (correo.lowercased() == usuario.email && clave == usuario.contrasena){
                currentUsuario = usuario.nombre!
                acceso = true
            }
        }
        
        
        
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
