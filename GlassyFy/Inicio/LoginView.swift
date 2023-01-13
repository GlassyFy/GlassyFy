import SwiftUI

struct LoginView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var correo: String = ""
    @State private var clave: String = ""
    @State private var wrongCorreo = 0
    @State private var wrongClave = 0
    @State private var aviso: String = ""
    @Binding var acceso: Bool
    @Binding var usuarioCurrent: UsuarioEntity
    @State var registroCorrecto: Bool = false

    var body: some View {
        
        GeometryReader{ gemr in
            ZStack{
                Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                    .ignoresSafeArea()
                
                VStack{
                    Image("glaston_b1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: gemr.size.width*0.9, height:gemr.size.height*0.3)
                        .padding(-100)
                        .padding(.top, 10)
                    
                    
                    
                    Text("Correo electrónico")
                        .frame(width: gemr.size.width*0.7, height: 42, alignment: .bottomLeading)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    TextField("", text: $correo)
                        .placeholder(Text("Introduzca su correo electrónico")
                            .foregroundColor(.white),show: correo.isEmpty)
                        .autocapitalization(.none)
                        .padding()
                        .frame(width: gemr.size.width*0.7, height: 42)
                        .foregroundColor(.white)
                        .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: CGFloat(wrongCorreo)))
                        .onSubmit {
                            autenticarUsuario(correoAux: correo, claveAux: clave)
                        }
                    
                    
                    Text("Contraseña")
                        .frame(width: gemr.size.width*0.7, height: 42, alignment: .bottomLeading)
                        .foregroundColor(.white)
                    
                    SecureField("", text: $clave)
                        .placeholder(Text("Introduzca su contraseña")
                            .foregroundColor(.white),show: clave.isEmpty)
                        .autocapitalization(.none)
                        .padding()
                        .frame(width: gemr.size.width*0.7, height: 42)
                        .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.red, lineWidth: CGFloat(wrongClave))
                        )
                        .onSubmit {
                            autenticarUsuario(correoAux: correo, claveAux: clave)
                        }
                    Text (aviso)
                        .foregroundColor(.red)
                        .font(.footnote)
                    
                    Button("Entrar"){
                        autenticarUsuario(correoAux: correo, claveAux: clave)
                    }
                    .foregroundColor(.white)
                    .frame(width: gemr.size.width*0.3 , height: 53)
                    .background(Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.top, 40)
                    .disabled(correo.isEmpty || clave.isEmpty)
                    .opacity(correo.isEmpty || clave.isEmpty ? 0.5 : 1.0 )
                    //                .fullScreenCover(isPresented: $acceso) {
                    //                    VistaMain(acceso: $acceso, usuarioCurrent: $usuarioCurrent).environmentObject(vm)
                    //                    //VistaPerfilUsuario(sesionIniciada: $sesionIniciada, usuarioCurrent:
                    //                    //usuarioCurrent).environmentObject(vm)
                    //                }
                    
                    //                .sheet(isPresented: $acceso, onDismiss: {acceso = false}, content: {
                    //                    ZStack{
                    //                        Color.green.ignoresSafeArea()
                    //                        Text("¡Bienvenido \(usuarioCurrent.email!) :D!")
                    //                    }
                    //                })
                    HStack{
                        Text("¿Aún no tienes cuenta?")
                            .foregroundColor(Color.white)
                            .font(.footnote)
                            .bold()
                        //                    NavigationLink(destination: RegistroView(usuarioCurrent: $usuarioCurrent, acceso: $acceso).environmentObject(vm)
                        NavigationLink(destination:
                                        RegistroView(registroCorrecto: $registroCorrecto).environmentObject(vm)
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
                    
                    if(registroCorrecto == true){
                        
                        HStack{
                            Image(systemName:"hand.thumbsup.fill")
                                .foregroundColor(Color.white)
                            Text("Registro realizado con éxito").foregroundColor(Color.white)
                                .fontWeight(.semibold)
                        }
                        .frame(width: gemr.size.width*0.7, height: 42)
                        .background(Color(red: 90 / 255, green: 163 / 255, blue: 100 / 255))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                                registroCorrecto = false
                            }
                        }
                        
                        
                    }
                    
                    Text("Glasston 2022")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .frame(width: 100, height: 10, alignment:.bottom)
                        .offset(x:0, y: 270)
                }
                .padding()
                .offset(x: 0 , y: -130)
                Spacer()
            }
            .onAppear(){
                wrongClave = 0
                wrongCorreo = 0
                aviso = ""
                correo = ""
                clave = ""
                //acceso = false
            }
            //        .onDisappear(){
            //            registroCorrecto = false
            //        }
            .navigationBarHidden(true)
        }
    }
    
    func autenticarUsuario(correoAux: String, claveAux: String){
        for usuario in vm.usuariosArray {
            if (correoAux.lowercased() == usuario.email && claveAux == usuario.contrasena){
                usuarioCurrent = usuario
                acceso = true
            }
        }
        if(acceso == false){
            wrongCorreo = 1
            wrongClave = 1
            aviso = "Correo electrónico o contraseña incorrectos"
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

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
