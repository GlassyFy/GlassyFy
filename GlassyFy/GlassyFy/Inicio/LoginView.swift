import SwiftUI

struct LoginView: View {
    @State private var correo: String = ""
    @State private var clave: String = ""
    var body: some View {
        ZStack{
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255).ignoresSafeArea()
            VStack{
                Image("logo_glassyfy")
                    .resizable()
                    .frame(width: 400, height:300)
                    .padding(-90)
                
                Text("Correo electrónico")
                    .foregroundColor(.white)
                
                TextField("Introduzca su correo electrónico", text: $correo)
                    .frame(width: 295, height: 42)
                    .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(10)
                
                
                Text("Contraseña")
                    .foregroundColor(.white)
                TextField("Introduzca su contraseña", text: $clave)
                    .frame(width: 295, height: 42)
                    .background(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(10)
                    
                
                Button("Entrar"){
                    
                }
                .frame(width: 144 , height: 53)
                .background(Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
                
                HStack{
                    Text("¿Aún no tienes cuenta?")
                        .foregroundColor(Color.white)
                        .font(.headline)
                    
                    Button("Regístrate aquí"){
                        
                    }
                    .foregroundColor(Color(red: 77 / 255, green: 167 / 255, blue: 231 / 255))
                    .font(.headline)
                    .padding()
                    .offset(x:-15, y:0)
                    
                }
                
            }
            .offset(x: 0 , y: -160)
            Spacer()
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
