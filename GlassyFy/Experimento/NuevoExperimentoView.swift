//
//  NuevoExperimento.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 18/11/22.
//

import SwiftUI


//var colorFondo: Color = Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)

var colorboton: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)

//var colorcampostxt: Color = Color(red: 65 / 255, green: 68 / 255, blue: 74 / 255)

var rojotxt: Color = Color(red: 199 / 255, green: 73 / 255, blue: 69 / 255)

var rojoboton: Color = Color(red: 237 / 255, green: 106 / 255, blue: 94 / 255)

var contrariofondotxt: Color = Color(red: 190 / 255, green: 187 / 255, blue: 181 / 255)
//MARK: CLASE DATOS EXP
class DatosExp: ObservableObject{
    @Published var nombre: String = ""
    @Published var fechaToma: Date = Date()
    @Published var descripcion: String = ""
    @Published var inref: Double = 0
    @Published var magnesio: Double = 0
    @Published var aluminio: Double = 0
    @Published var potasio: Double = 0
    @Published var calcio: Double = 0
    @Published var bario: Double = 0
}

//MARK: Primera vista
struct AnadirDatosExpView: View {
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var datos = DatosExp()
    //@Binding var nombre: String
    //@Binding var fechaToma: Date
    //@Binding var descripcion: String
    
    
    
    var body: some View {
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
                        }
            
                        TextField("", text: $datos.nombre)
                            .frame(height: 42)
                            .background(colorcampostxt)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(.white)
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
                                    .frame(height: 278)
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
                        
                    NavigationLink(destination: AnadirDatosExpB(datos: datos)){
                    Text("Siguiente")
                        .frame(width: 100, height: 55)
                            .background(colorboton)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    Spacer()
                }.frame(width: 295)
                    .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                    .navigationBarBackButtonHidden(true)

            )
        Spacer()
    }
}

//MARK: Segunda vista

struct AnadirDatosExpB: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var datos = DatosExp()
    
    @State var parametro: Double = 0
    
    @State var selectIR: Bool = false
    @State var selectMG: Bool = false
    @State var selectAL: Bool = false
    @State var selectK: Bool = false
    @State var selectCa: Bool = false
    @State var selectBa: Bool = false
    
//    @Binding var nombre: String
//    @Binding var fechaToma: Date
//    @Binding var descripcion: String
    
    @State var minValue: Double = 0
    @State var maxValue: Double = 0
    
    var body: some View{
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
                VStack{
                    //Spacer()
                    Text("Datos de la muestra")
                        .font(.title)
                    Spacer()
                    VStack{
                        HStack{
                            Text("Índice de refracción (IR)")
                                .frame(width: 200, height: 37)
                                .background(selectIR ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.inref))")
                                .frame(width: 99,  height: 34)
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
                                .frame(width: 200, height: 37)
                                .background(selectMG ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.magnesio))")
                                .frame(width: 99,  height: 34)
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
                                .frame(width: 200, height: 37)
                                .background(selectAL ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.aluminio))")
                                .frame(width: 99,  height: 34)
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
                                .frame(width: 200, height: 37)
                                .background(selectK ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.potasio))")
                                .frame(width: 99,  height: 34)
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
                                .frame(width: 200, height: 37)
                                .background(selectCa ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.calcio))")
                                .frame(width: 99,  height: 34)
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
                                .frame(width: 200, height: 37)
                                .background(selectBa ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.bario))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            selectBa = true
                            selectIR = false; selectMG = false; selectAL = false; selectK = false; selectCa = false;
                            minValue = 0
                            maxValue = 3.5
                        }
                        
                        Button("Limpiar datos"){
                            datos.inref = 0
                            datos.magnesio = 0
                            datos.aluminio = 0
                            datos.potasio = 0
                            datos.calcio = 0
                            datos.bario = 0
                        }.foregroundColor(rojotxt)
                        
                        HStack{
                            Spacer()
                            Text("\(String(format: "%.2f", minValue))")
                            Slider(value: selectIR ? $datos.inref : selectMG ? $datos.magnesio : selectAL ? $datos.aluminio : selectK ? $datos.potasio : selectCa ? $datos.calcio : selectBa ? $datos.bario : $parametro, in: minValue...maxValue)
                            Text("\(String(format: "%.2f", maxValue))")
                            Spacer()
                        }.frame(width: 310, height: 50)
                            .background(colorcampostxt)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
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
                            
                        NavigationLink(destination:RevisionDatosExp(datos: datos)){
                                Text("Siguiente")
                                    .frame(width: 150, height: 55)
                                    .background(colorboton)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                            }
                        
                    }
                    Spacer()
                }.frame(width: 295)
                    .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                    .navigationBarBackButtonHidden(true)
            )
        Spacer()
    }
}

//MARK: Ultima vista
struct RevisionDatosExp: View{
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var datos = DatosExp()
    
    //@State var nombre: String = ""
    //@State var descripcion: String = "DESCRIPCION"
    //@State var fechaToma: Date = Date()
    
    @State var indiceRef: Double = 0
    @State var magnesio: Double = 0
    @State var aluminio: Double = 0
    @State var potasio: Double = 0
    @State var calcio: Double = 0
    @State var bario: Double = 0
    
    
    var body: some View{
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
//                    Text("Repaso de la información")
//                        .foregroundColor(.white)
//                        .font(.custom("g" ,size: 26))
//                    Spacer()
                    
                    VStack{
                        HStack{
                            Text("Nombre del experimento")
                                .foregroundColor(.white)
                                .font(.headline)
                            Spacer()
                        }
                        Text(datos.nombre)
                            .frame(width: 295, height: 42)
                            .background(colorcampostxt)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(.white)
                        
                        HStack{
                            Text("Fecha de toma")
                                .foregroundColor(.white)
                                .font(.headline)
                            Text("\(datos.fechaToma.formatted())")
                                .frame(width: 170, height: 42)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        HStack{
                            Text("Descripción")
                                .foregroundColor(.white)
                                .font(.headline)
                            Spacer()
                        }
                        
                        Text("\(datos.descripcion)")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            //.padding(.top, 10)
                            .padding(.all, 10)
                            .frame(width:295, alignment: .topLeading)
                            .background(colorcampostxt)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            //.multilineTextAlignment(.leading)
                        
                        HStack{
                        Text("Datos")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                        }
                        
                        HStack{
                            Text("Indice Refracción (IR)")
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.inref))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        HStack{
                            Text("Magnesio (Mg)")
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.magnesio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                    }
                    VStack{
                        HStack{
                            Text("Aluminio (Al)")
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.aluminio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Potasio (K)")
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.potasio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Calcio (Ca)")
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.calcio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Bario (Ba)")
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", datos.bario))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
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
                        
                        NavigationLink(destination:AnadirDatosExpView()){
                            Text("Confirmar")
                                .frame(width: 150, height: 55)
                                .background(colorboton)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                            
                        }
                    }
                    Spacer()
                }.frame(width: 295)
                    .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                    .navigationBarBackButtonHidden(true)
                
            )
    }
}


struct NuevoExperimentoView_Previews: PreviewProvider {
    static var previews: some View {
        RevisionDatosExp()
    }
}


func calcularTipo(iR: Double, mag: Double, alu: Double, pot: Double, cal: Double, bar: Double) -> String{
    
    return "def"
}
