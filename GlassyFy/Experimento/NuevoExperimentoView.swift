//
//  NuevoExperimento.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 18/11/22.
//

import SwiftUI


private var tipoNombre = "Holas"
//MARK: CLASE DATOS EXP
class DatosExp: ObservableObject{
    @Published var nombre: String = ""
    @Published var fechaToma: Date = Date()
    @Published var descripcion: String = ""
    @Published var inref: Double = 0.0
    @Published var magnesio: Double = 0
    @Published var aluminio: Double = 0
    @Published var potasio: Double = 0
    @Published var calcio: Double = 0
    @Published var bario: Double = 0
    @Published var tipo: String = "Cristal flotado"
    
    @Published var inrefStr: String = ""
    @Published var mgStr: String = ""
    @Published var alStr: String = ""
    @Published var kStr: String = ""
    @Published var caStr: String = ""
    @Published var baStr: String = ""
    
    
    //Si el valor proporcionado no es numerico, se pondrá el valor medio que tiene en el estudio
    func updateInRef(){
        inref = Double(inrefStr) ?? 1.5184
    }
    
    func updateMg(){
        magnesio = Double(mgStr) ?? 2.6845
    }
    
    func updateAl(){
        aluminio = Double(alStr) ?? 1.4449
    }
    
    func updateK(){
        potasio = Double(kStr) ?? 0.4971
    }
    
    func updateCa(){
        calcio = Double(caStr) ?? 8.9570
    }
    
    func updateBa(){
        bario = Double(baStr) ?? 0.1750
    }
    
}

//MARK: Primera vista
struct AnadirDatosExpView: View {
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var datos = DatosExp()
    @Binding var usuarioCurrent: UsuarioEntity
    
    var body: some View {
        GeometryReader{ gemr in
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .ignoresSafeArea()
                .overlay(
                    VStack{
                        Spacer()
                        Text("Datos tecnicos")
                            .font(.title)
                        Spacer()
                        VStack{
                            HStack{
                                Text("Nombre del experimento")
                                    .font(.headline)
                                Spacer()
                                Text("\(datos.nombre.count)/20")
                                    .foregroundColor(rojotxt)
                                
                            }
                
                            TextField("", text: $datos.nombre)
                                .frame(height: 42)
                                .padding(.leading, 5)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                                .onChange(of: self.datos.nombre){ value in
                                    if Int(datos.nombre.count) > 20 {
                                        self.datos.nombre = String(value.prefix(20))
                                    }
                                }
                        }
                        HStack{
                            Text("Fecha de toma")
                            Spacer()
                            DatePicker("", selection: $datos.fechaToma, displayedComponents: .date)
                            .colorInvert()

                        }
                        
                        VStack{
                            HStack{
                                Text("Descripcion")
                                Spacer()
                                Text("\(datos.descripcion.count)/300")
                                    .foregroundColor(rojotxt)
                            }
                            VStack{
                                TextEditor(text: $datos.descripcion)
                                    .frame(height: gemr.size.height*0.4)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .onChange(of: self.datos.descripcion){ value in
                                            if Int(datos.descripcion.count) > 300 {
                                                self.datos.descripcion = String(value.prefix(300))
                                            }
                                        }
                                        .colorMultiply(contrariofondotxt)
                                        .foregroundColor(.black)
                                        .colorInvert()
                                    
                                
                                Button("Limpiar datos"){
                                    datos.descripcion = ""
                                    datos.fechaToma = Date()
                                    datos.nombre = ""
                                    
                                }.foregroundColor(rojotxt)
                            }
                        }
                            
                        NavigationLink(destination: AnadirDatosExpB(datos: datos, usuarioCurrent: $usuarioCurrent)){
                        Text("Siguiente")
                            .frame(width: 150, height: 55)
                                .background(colorboton)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        Spacer()
                    }.frame(width: gemr.size.width*0.7)
                        .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitleDisplayMode(.inline)

                )
            Spacer()
        }
        
    }
}

//MARK: Segunda vista

struct AnadirDatosExpB: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var datos = DatosExp()
    @Binding var usuarioCurrent: UsuarioEntity
    
    @State var parametro: Double = 0
    @State var parStr: String = ""
    
    @State var selectIR: Bool = false
    @State var selectMG: Bool = false
    @State var selectAL: Bool = false
    @State var selectK: Bool = false
    @State var selectCa: Bool = false
    @State var selectBa: Bool = false
    
    @State var minValue: Double = 0
    @State var maxValue: Double = 0
    
    var tipo = ["Cristal flotado", "Cristal no flotado", "Parabrisas flotado", "Parabrisas no flotado", "Cristal de recipiente", "Cristal de vajilla", "Cristal de faro"]
    @State var selectTipo = "Cristal flotado"
    
    var body: some View{
        GeometryReader{ gemr in
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .ignoresSafeArea()
                .overlay(
                    VStack{
                        Text("Datos de la muestra")
                            .font(.title)
                        Spacer()
                        VStack{
                            HStack{
                                Text("Índice de refracción (IR)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(selectIR ?  colorboton :colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.5f", datos.inref))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }.onTapGesture {
                                selectIR = true
                                selectMG = false; selectAL = false; selectK = false; selectCa = false; selectBa = false;
                                minValue = 1
                                maxValue = 2
                                
                            }
                            
                            HStack{
                                Text("Magnesio (Mg)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(selectMG ?  colorboton :colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.2f", datos.magnesio))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }.onTapGesture {
                                selectMG = true
                                selectIR = false; selectAL = false; selectK = false; selectCa = false; selectBa = false;
                                minValue = 0
                                maxValue = 5
                            }
                            
                            HStack{
                                Text("Aluminio (Al)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(selectAL ?  colorboton :colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.2f", datos.aluminio))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }.onTapGesture {
                                selectAL = true
                                selectIR = false; selectMG = false; selectK = false; selectCa = false; selectBa = false;
                                minValue = 0.1
                                maxValue = 3.6
                            }
                            
                            HStack{
                                Text("Potasio (K)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(selectK ?  colorboton :colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.2f", datos.potasio))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }.onTapGesture {
                                selectK = true
                                selectIR = false; selectMG = false; selectAL = false; selectCa = false; selectBa = false;
                                minValue = 0
                                maxValue = 6.5
                            }
                            
                            HStack{
                                Text("Calcio (Ca)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(selectCa ?  colorboton :colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.2f", datos.calcio))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }.onTapGesture {
                                selectCa = true
                                selectIR = false; selectMG = false; selectAL = false; selectK = false; selectBa = false;
                                minValue = 5.3
                                maxValue = 16.5
                            }
                            
                            HStack{
                                Text("Bario (Ba)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(selectBa ?  colorboton :colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.2f", datos.bario))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }.onTapGesture {
                                selectBa = true
                                selectIR = false; selectMG = false; selectAL = false; selectK = false; selectCa = false;
                                minValue = 0
                                maxValue = 3.5
                            }
                            
                            #if LPS2
                            Text("Selecciona el tipo de cristal")
                                .frame(width: gemr.size.width*0.8, height: 50)
                            Picker("Selecciona el tipo de cristal", selection: $datos.tipo){
                                ForEach(tipo, id: \.self){
                                    Text($0)
                                }
                            }.frame(width: gemr.size.width*0.52, height: 50)
                                .background(colorcampostxt)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10).stroke(colorboton, lineWidth: 2)
                                )
                            #endif
                            
                            Button("Limpiar datos"){
                                datos.inref = 0
                                datos.magnesio = 0
                                datos.aluminio = 0
                                datos.potasio = 0
                                datos.calcio = 0
                                datos.bario = 0
                            }.foregroundColor(rojotxt)
                            
                            if(selectIR || selectMG || selectK || selectAL || selectBa || selectCa){
                            HStack{
                                Spacer()
                                
                                Text("\(String(format: "%.2f", minValue))")
                                
                                Slider(value: selectIR ? $datos.inref : selectMG ? $datos.magnesio : selectAL ? $datos.aluminio : selectK ? $datos.potasio : selectCa ? $datos.calcio : selectBa ? $datos.bario : $parametro, in: minValue...maxValue)
                                Text("\(String(format: "%.2f", maxValue))")
                                
                                Spacer()
                            }.frame(width: gemr.size.width*0.8, height: 50)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            //Campo de texto para INREF
                            HStack{
                                //if(selectIR){
                                    VStack{
                                        Text("Puedes escribirlo para mayor precisión")
                                            .foregroundColor(.white)
                                    
                                        //TextField("", text: $datos.inrefStr)
                                        TextField("", text: selectIR ? $datos.inrefStr : selectMG ? $datos.mgStr : selectAL ? $datos.alStr : selectK ? $datos.kStr : selectCa ? $datos.caStr : selectBa ? $datos.baStr : $parStr)
                                            .keyboardType(.decimalPad)
                                        .frame(width: gemr.size.width*0.8, height: 50)
                                        .background(colorcampostxt)
                                        .foregroundColor(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .onChange(of: datos.inrefStr){ value in
                                            datos.updateInRef()
                                        }
                                        .onChange(of: datos.mgStr){ value in
                                            datos.updateMg()
                                        }
                                        .onChange(of: datos.alStr){ value in
                                            datos.updateAl()
                                        }
                                        .onChange(of: datos.kStr){ value in
                                            datos.updateK()
                                        }
                                        .onChange(of: datos.caStr){ value in
                                            datos.updateCa()
                                        }
                                        .onChange(of: datos.baStr){ value in
                                            datos.updateBa()
                                        }
                                        
                                        
                                    }
                                }
                            }
                        }
                        Spacer()
                        HStack{
                            
                                Button("Volver atrás"){
                                    presentation.wrappedValue.dismiss()
                                }
                                    .frame(width: 150, height: 55)
                                    .background(rojoboton)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                            NavigationLink(destination:RevisionDatosExp(datos: datos, usuarioCurrent: $usuarioCurrent)){
                                    Text("Siguiente")
                                        .frame(width: 150, height: 55)
                                        .background(colorboton)
                                        .foregroundColor(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                }
                            
                        }.padding(.bottom, 10)
                        //Spacer()
                    }.frame(width: gemr.size.width*0.95 )
                        .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
                )
            //Spacer()
        }
        
    }
}

//MARK: Ultima vista
struct RevisionDatosExp: View{
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var datos = DatosExp()
    
    @State var popUpVisible = false
    @Binding var usuarioCurrent: UsuarioEntity
    
    var body: some View{
        GeometryReader{ gemr in
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .ignoresSafeArea()
                .overlay(
                    VStack{
                        Text("Revision de los datos")
                            .font(.title)
                            //.padding(.bottom, 10)
                        Spacer()
                    ScrollView(showsIndicators: false){
                    VStack{
                        VStack{
                            HStack{
                                Text("Nombre del experimento")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Spacer()
                            }
                            .frame(width: gemr.size.width*0.8, height: 42)
                            Text(datos.nombre)
                                .frame(width: gemr.size.width*0.8, height: 42)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                            
                            HStack{
                                
                                Text("Fecha de toma")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Spacer()
                                Text("\(datos.fechaToma.formatted(date: .numeric, time: .omitted))")
                                    .frame(width: gemr.size.width*0.4, height: 42)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }
                            .frame(width: gemr.size.width*0.8)
                            

                            HStack{
                            Text("Datos")
                                .foregroundColor(.white)
                                .font(.headline)
                            Spacer()
                            }
                            .frame(width: gemr.size.width*0.8, height: 42)
                            
                            HStack{
                                Text("Indice Refracción (IR)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.5f", datos.inref))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }
                            HStack{
                                Text("Magnesio (Mg)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.2f", datos.magnesio))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }
                        }
                        VStack{
                            HStack{
                                Text("Aluminio (Al)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.2f", datos.aluminio))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }
                            
                            HStack{
                                Text("Potasio (K)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.2f", datos.potasio))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }
                            
                            HStack{
                                Text("Calcio (Ca)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.2f", datos.calcio))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }
                            
                            HStack{
                                Text("Bario (Ba)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\(String(format: "%.2f", datos.bario))")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                            }
                            #if LPS2
                            HStack{
                                Text("Tipo")
                                    .frame(width: gemr.size.width*0.25,  height: 37)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10).stroke(azultipo, lineWidth: 2)
                                    )
                                
                                Text("\(datos.tipo)")
                                    .frame(width: gemr.size.width*0.52, height: 37)
                                    .background(colorcampostxt)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10).stroke(azultipo, lineWidth: 2)
                                    )
                            }
                            
                            #endif
                            
                            HStack{
                                Text("Descripción")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Spacer()
                            }
                            .frame(width: gemr.size.width*0.8, height: 42)
                            
                            Text(datos.descripcion == "" ? "Sin descripción. " : "\(datos.descripcion)")
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.leading)
                                //.padding(.top, 10)
                                .padding(.all, 10)
                                .frame(width: gemr.size.width*0.8, alignment: .topLeading)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                //.multilineTextAlignment(.leading)
                            
                        }
                    }
                    }
                        HStack{
                            Button("Volver atrás"){
                                presentation.wrappedValue.dismiss()
                            }
                            .frame(width: 150, height: 55)
                            .background(rojoboton)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            
                           
                            Text("Confirmar").onTapGesture {
                                    self.popUpVisible = true
                                #if LPS1
                                datos.tipo = calcularTipo(RI: datos.inref, Mg: datos.magnesio, Al: datos.aluminio, K: datos.potasio, Ca: datos.calcio, Ba: datos.bario)
                                #endif
                                
                                tipoNombre = datos.tipo
                                
                                vm.addExperimento(usuario: usuarioCurrent, nombre: datos.nombre == "" ? "Experimento" : datos.nombre, fechaToma: datos.fechaToma, descripcion: datos.descripcion, inRef: datos.inref, magnesio: datos.magnesio, aluminio: datos.aluminio, potasio: datos.potasio, Calcio: datos.calcio, Bario: datos.bario, tipo: datos.tipo)
                                }
                                    .frame(width: 150, height: 55)
                                    .background(colorGreen)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .popover(isPresented: $popUpVisible){
                                        popUpExito( visible: self.$popUpVisible)
                                    }
                                //Aqui navegamos al popup
                                    
                            NavigationLink(destination:AnadirDatosExpView(usuarioCurrent: $usuarioCurrent), isActive: $popUpVisible){
                                EmptyView()
                            }
                        }
                        Spacer()
                    }.frame(width: gemr.size.width*0.9)
                        .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
                        
                    
                )
        }
        
    }
}


//MARK: POPUP DE ÉXITO

struct popUpExito: View{
    
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var datos = DatosExp()
    
    @Binding var visible: Bool
    
    var body: some View{
        GeometryReader{ gemr in
            Color(red: 90 / 255, green: 163 / 255, blue: 100 / 255)
                .ignoresSafeArea()
                .overlay(
                    VStack{
                        Spacer()
                        Text("Guardado con éxito")
                            .font(.title)
                        Spacer()
                        #if LPS1
                        Text("El cristal es de tipo:")
                            .font(.title3)
                        //TODO: Implementar el tipo de cristal tras el calculo
                        Text("\(tipoNombre)")
                            .font(.largeTitle)
                            .padding()
                        //Aqui podríamos poner una foto del tipo de cristal, para hacer la vista más completa.
                        //Image(systemName: "wineglass.fill")
                        
                        Spacer()
                        #endif
                        Text("Deslice hacia abajo...")
                            .font(.system(size: 10))
                        //TODO: No se pq pero el botón no cierra el popup al haber incluido el metodo para anadir el experimento a la bbdd.
    //                    Button("Aceptar"){
    //                        presentation.wrappedValue.dismiss()
    //                        visible = true
    //                    }
    //                    .frame(width: 150, height: 55)
    //                    .background(.green)
    //                    .foregroundColor(.white)
    //                    .clipShape(RoundedRectangle(cornerRadius: 30))
                        Spacer()
                    }.navigationBarTitleDisplayMode(.inline)
                )    }
        }
        
}

//struct NuevoExperimentoView_Previews: PreviewProvider {
//    static var previews: some View {
//        popUpExito()
//    }
//}
