import SwiftUI

struct LoginView: View {
    @State private var correo: String = ""
    @State private var clave: String = ""
    @State private var wrongCorreo = 0
    @State private var wrongClave = 0
    @State private var acceso = false
    let boton: UIButton = UIButton()
    @State private var opacidad: Double = 1.0
    //    var iconClick = true //Implementar funcionalidad para un icono que muestre o no la contraseña
    var body: some View {
        //Boton visible cuando los campos no estén vacios
//        if !correo.isEmpty && !clave.isEmpty {
//            opacidad = 1.0
//        }
//        return
        NavigationView{
            ZStack{
                Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                    .ignoresSafeArea()
                //Cambiar el color de los placeholders a blanco
                
                VStack{
                    Image("logo_glassyfy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height:300)
                        .padding(-100)
                    
                    Text("Correo electrónico")
                        .frame(width: 295, height: 42, alignment: .bottomLeading)
                        .foregroundColor(.white)
                    
                    TextField("Introduzca su correo electrónico", text: $correo)
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
                    
                    SecureField("Introduzca su contraseña", text: $clave)
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
                    .opacity(opacidad)
                   
                        
                    
                    NavigationLink(destination: Text("Acceso a la app realizado :D"),
                                   isActive: $acceso){
                        EmptyView()
                    }
                    
                    HStack{
                        Text("¿Aún no tienes cuenta?")
                            .foregroundColor(Color.white)
                            .font(.footnote)
                            .bold()
                        NavigationLink(destination: RegistroView().navigationBarBackButtonHidden(true)) {
                            Text("Regístrate aquí")
                            .foregroundColor(Color(red: 77 / 255, green: 167 / 255, blue: 231 / 255))
                            .font(.footnote)
                            .padding()
                        
                        }
                        .offset(x:-15, y:0)
                    }
                }
                .padding()
                .offset(x: 0 , y: -130)
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
    func autenticarUsuario(correo: String, clave: String){
        //Aquí habría que hacer conexión con la base de datos...
        //Usuario y contraseña de ejemplo
        if correo.lowercased() == "admin"{
            wrongCorreo = 0
            if clave.lowercased() == "admin"{
                wrongClave = 0
                acceso = true
            }else {
                wrongClave = 2
            }
        }else{
            wrongCorreo = 2
        }
            
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
