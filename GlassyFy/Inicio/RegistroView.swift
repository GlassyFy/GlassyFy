import SwiftUI

struct RegistroView: View {
    @State private var registroCorrecto = false //Cambiar a false luego para correcta funcionalidad
    @State private var usuario: String = ""
    @State private var clave: String = ""
    @State private var clave2: String = ""
    @State private var correo: String = ""
    @State private var opacidad: Double = 0.5
    @State private var camposVacios = true
    
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
                        .onChange(of: usuario){ vacio in
                            comprobarCampos()
                        }
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
                    .onChange(of: clave){ vacio in
                        comprobarCampos()
                    }
                
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
                    .onChange(of: clave2){ vacio in
                        comprobarCampos()
                    }
                
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
                    .onChange(of: correo){ vacio in
                        comprobarCampos()
                    }
                
                Group {
                    Button("Registrarse"){
                        //Hay que completar la funcionalidad del boton para que añada usuarios a base de datos
                        //una vez que haya validado el registro (contraseñas que coincidan, nombre de usuario
                        //no repetido, correo no repetido, correo con @, contraseña con mayuscula...)
                        //Registro de eemplo:
                        validarRegistro(usuario: usuario, clave: clave, clave2: clave2, correo: correo)
                    }
                    .frame(width: 144 , height: 53)
                    .background(Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.top, 20)
                    .disabled(usuario.isEmpty ||  clave.isEmpty ||  clave2.isEmpty || correo.isEmpty)
                    .onChange(of: camposVacios) { opacidad in
                        if(camposVacios == false){
                            self.opacidad = 1.0
                        }else{
                            self.opacidad = 0.5
                        }
                    }
                    .opacity(opacidad)
                    
                    
                    NavigationLink(destination: Text("Registro relizado :D")
                                   ,isActive: $registroCorrecto){
                        EmptyView()
                    }
                    
                    
                    HStack{
                        Text("¿Ya tienes cuenta?")
                            .foregroundColor(Color.white)
                            .font(.footnote)
                            .bold()
                        NavigationLink(destination: LoginView()
                            //.animation(.easeInOut(duration: 0.5))
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)) {
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
        .toolbar(content: {
            ToolbarItem(placement: .bottomBar){
                Text("GlassyFy 2022")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
            }
        })
    }
    func validarRegistro(usuario: String, clave: String, clave2: String, correo: String){
        //Aquí habría que hacer conexión con la base de datos...
        //Validacion de registro de ejemplo
        if(!(usuario.isEmpty || clave.isEmpty || clave2.isEmpty || correo.isEmpty)){
            registroCorrecto = true
        }
    }
    
    func comprobarCampos(){
        if(!usuario.isEmpty && !clave.isEmpty && !clave2.isEmpty && !correo.isEmpty){
            camposVacios = false
        }else{
            camposVacios = true
        }
        if(usuario.isEmpty || clave.isEmpty || clave2.isEmpty || correo.isEmpty ){
            camposVacios = true
        }
    }
}



struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView()
    }
}
