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
                .frame(width: 300, height:200)
                Text("Correo electrónico").foregroundColor(.white)
                TextField("Introduzca su correo", text: $correo).foregroundColor(.white)
                Text("Contraseña").foregroundColor(.white)
                TextField("Introduzca su contraseña", text: $clave).foregroundColor(.white)
                Button("Entrar"){
                    
                }.foregroundColor(.white)
                
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
