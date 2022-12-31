//
//  calcularTipo.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 29/12/22.
//

import Foundation

private var tipoCristal: [String : Double] = [:]


func calcularTipo(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    if (Ba > 0.27){
        return hoja7(RI: RI, Mg: Mg, Al: Al, K: K, Ca: Ca, Ba: Ba)
    } else {
        if (Mg <= 2.41){
            return hoja1(RI: RI, Mg: Mg, Al: Al, K: K, Ca: Ca, Ba: Ba)
        }else{
            if (Al > 1.41){
                if (Ca <= 3.45){
                    return hoja5(RI: RI, Mg: Mg, Al: Al, K: K, Ca: Ca, Ba: Ba)
                }else{
                    return hoja6(RI: RI, Mg: Mg, Al: Al, K: K, Ca: Ca, Ba: Ba)
                }
            }else{
                if (RI <= 1.51707){
                    return hoja2(RI: RI, Mg: Mg, Al: Al, K: K, Ca: Ca, Ba: Ba)
                }else{
                    if(K <= 0.23){
                        return hoja3(RI: RI, Mg: Mg, Al: Al, K: K, Ca: Ca, Ba: Ba)
                    }else{
                        return hoja4(RI: RI, Mg: Mg, Al: Al, K: K, Ca: Ca, Ba: Ba)
                    }
                }
            }
        }
    }
}

/*
 Las funciones reciben los atributos y simplemente retorna un String con el nombre del tipo de cristal.
 Para trabajar con los datos, he optado por montar diccionarios, cuya clave es el tipo, y el valor el
 calculado con los distintos atributos que componen dicho tipo.
 Luego elegimos con una simple busqueda el tipo que presenta un mayor valor, y se indicaría como el tipo.
 */

/*Si Ba <= 0.27 && Mg <= 2.41 */
func hoja1(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["buildWindFloat"] = -145.54 + RI * 90.16 + Mg * 1.32 + Al * -4.5 + K * 0.78 + Ca * 0.06 + Ba * -9.19
    
    tipoCristal["buildWindNonFloat"] = -786.27 + RI * 519.68 + Mg * -0.4 + Al * -1.28 + K * 0.8 + Ca * -0.11 + Ba * 8.25
    
    tipoCristal["vehicWindFloat"] = 460.78 + RI * -316.05 + Mg * 1.76 + Al * -2.75 + K * -2.68 + Ca * 0.87
    
    tipoCristal["vehicWindNonFloat"] = -31.08 + Mg * 0.01 + Al * -0
    
    tipoCristal["containers"] = 871.16 + RI * -584.24 + Mg * -0.57 + Al * 4.56 + K * 0.86 + Ca * 1.09 + Ba * 2.46
    
    tipoCristal["tableware"] = -824.35 + RI * 553.91 + Mg * -0.21 + Al * 4.65 + K * -113.95 + Ca * -1.65 + Ba * -3.04
    
    tipoCristal["headlamps"] = -1444.01 + RI * 966.12 + Mg * -0.84 + Al * 0.36 + K * 1.46 + Ca * -2.49 + Ba * -7.47
    
    var claveMaxima = ""
    var valorMaximo = -100000.0

    for (clave, valor) in tipoCristal {
      if valor > valorMaximo {
        claveMaxima = clave
        valorMaximo = valor
      }
    }
    
    tipoCristal.removeAll()
    return claveMaxima
}

/*Si Ba  <= 0.27 && Mg > 2.41 && Al <= 1.41 && RI <= 1.51707 */
func hoja2(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["buildWindFloat"] = 87436.25 + RI * -57673.49 + Mg * -0.3 + Al * -3.22 + K * 8.39 + Ca * -0.27 + Ba * -11.98
    
    tipoCristal["buildWindNonFloat"] = -14792.07 + RI * 9815.19 + Mg * 0.83 + Al * -67.56 + K * -10.17 + Ca * -0.32 + Ba * -7.98
    
    tipoCristal["vehicWindFloat"] = 6100.72 + RI * -4073.23 + Mg * 1.52 + Al * 10.93 + K * -3.71 + Ca * 7.25 + Ba * 1.81
    
    tipoCristal["vehicWindNonFloat"] = -51.65 + Mg * 0.01 + Al * -0
    
    tipoCristal["containers"] = 17.53 + RI * -38.05 + Mg * -1.25 + Al * 3.98 + K * 0.49 + Ca * 0.46 + Ba * 2.46
    
    tipoCristal["tableware"] = 154.89 + RI * -118.9 + Mg * -0.21 + Al * 3.9  + K * -112.96 + Ca * -0.54 + Ba * -3.04

    
    tipoCristal["headlamps"] = -3733.18 + RI * 2457.43 + Mg * -6 + Al * 0.36 + K * 29.99 + Ca * -1.31 + Ba * 1.62
    
    var claveMaxima = ""
    var valorMaximo = -100000.0

    for (clave, valor) in tipoCristal {
      if valor > valorMaximo {
        claveMaxima = clave
        valorMaximo = valor
      }
    }
    
    tipoCristal.removeAll()
    return claveMaxima
}

//TODO: IMPLEMENTAR ECUACIONES CORRECTAS (copy paste del 1)
/*Si Ba  <= 0.27 && Mg > 2.41 && Al <= 1.41 && RI > 1.51707 && K <= 0.23 */
func hoja3(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["buildWindFloat"] = -145.54 + RI * 90.16 + Mg * 1.32 + Al * -4.5 + K * 0.78 + Ca * 0.06 + Ba * -9.19
    
    tipoCristal["buildWindNonFloat"] = -786.27 + RI * 519.68 + Mg * -0.4 + Al * -1.28 + K * 0.8 + Ca * -0.11 + Ba * 8.25
    
    tipoCristal["vehicWindFloat"] = 460.78 + RI * -316.05 + Mg * 1.76 + Al * -2.75 + K * -2.68 + Ca * 0.87
    
    tipoCristal["vehicWindNonFloat"] = -31.08 + Mg * 0.01 + Al * -0
    
    tipoCristal["containers"] = 871.16 + RI * -584.24 + Mg * -0.57 + Al * 4.56 + K * 0.86 + Ca * 1.09 + Ba * 2.46
    
    tipoCristal["tableware"] = -824.35 + RI * 553.91 + Mg * -0.21 + Al * 4.65 + K * -113.95 + Ca * -1.65 + Ba * -3.04
    
    tipoCristal["headlamps"] = -1444.01 + RI * 966.12 + Mg * -0.84 + Al * 0.36 + K * 1.46 + Ca * -2.49 + Ba * -7.47
    
    var claveMaxima = ""
    var valorMaximo = -100000.0

    for (clave, valor) in tipoCristal {
      if valor > valorMaximo {
        claveMaxima = clave
        valorMaximo = valor
      }
    }
    
    tipoCristal.removeAll()
    return claveMaxima
}

//TODO: IMPLEMENTAR ECUACIONES CORRECTAS (copy paste del 1)
/*Si Ba  <= 0.27 && Mg > 2.41 && Al <= 1.41 && RI > 1.51707 && K > 0.23 */
func hoja4(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["buildWindFloat"] = -145.54 + RI * 90.16 + Mg * 1.32 + Al * -4.5 + K * 0.78 + Ca * 0.06 + Ba * -9.19
    tipoCristal["buildWindNonFloat"] = -786.27 + RI * 519.68 + Mg * -0.4 + Al * -1.28 + K * 0.8 + Ca * -0.11 + Ba * 8.25
    tipoCristal["vehicWindFloat"] = 460.78 + RI * -316.05 + Mg * 1.76 + Al * -2.75 + K * -2.68 + Ca * 0.87
    tipoCristal["vehicWindNonFloat"] = -31.08 + Mg * 0.01 + Al * -0
    tipoCristal["containers"] = 871.16 + RI * -584.24 + Mg * -0.57 + Al * 4.56 + K * 0.86 + Ca * 1.09 + Ba * 2.46
    tipoCristal["tableware"] = -824.35 + RI * 553.91 + Mg * -0.21 + Al * 4.65 + K * -113.95 + Ca * -1.65 + Ba * -3.04
    tipoCristal["headlamps"] = -1444.01 + RI * 966.12 + Mg * -0.84 + Al * 0.36 + K * 1.46 + Ca * -2.49 + Ba * -7.47
    
    var claveMaxima = ""
    var valorMaximo = -100000.0

    for (clave, valor) in tipoCristal {
      if valor > valorMaximo {
        claveMaxima = clave
        valorMaximo = valor
      }
    }
    
    tipoCristal.removeAll()
    return claveMaxima
}

//TODO: IMPLEMENTAR ECUACIONES CORRECTAS (copy paste del 1)
/*Si Ba  <= 0.27 && Mg > 2.41 && Al > 1.41 && Ca <= 3.45 */
func hoja5(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["buildWindFloat"] = -145.54 + RI * 90.16 + Mg * 1.32 + Al * -4.5 + K * 0.78 + Ca * 0.06 + Ba * -9.19
    tipoCristal["buildWindNonFloat"] = -786.27 + RI * 519.68 + Mg * -0.4 + Al * -1.28 + K * 0.8 + Ca * -0.11 + Ba * 8.25
    tipoCristal["vehicWindFloat"] = 460.78 + RI * -316.05 + Mg * 1.76 + Al * -2.75 + K * -2.68 + Ca * 0.87
    tipoCristal["vehicWindNonFloat"] = -31.08 + Mg * 0.01 + Al * -0
    tipoCristal["containers"] = 871.16 + RI * -584.24 + Mg * -0.57 + Al * 4.56 + K * 0.86 + Ca * 1.09 + Ba * 2.46
    tipoCristal["tableware"] = -824.35 + RI * 553.91 + Mg * -0.21 + Al * 4.65 + K * -113.95 + Ca * -1.65 + Ba * -3.04
    tipoCristal["headlamps"] = -1444.01 + RI * 966.12 + Mg * -0.84 + Al * 0.36 + K * 1.46 + Ca * -2.49 + Ba * -7.47
    
    var claveMaxima = ""
    var valorMaximo = -100000.0

    for (clave, valor) in tipoCristal {
      if valor > valorMaximo {
        claveMaxima = clave
        valorMaximo = valor
      }
    }
    
    tipoCristal.removeAll()
    return claveMaxima
}

//TODO: IMPLEMENTAR ECUACIONES CORRECTAS (copy paste del 1)
/*Si Ba  <= 0.27 && Mg > 2.41 && Al > 1.41 && Ca > 3.45 */
func hoja6(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["buildWindFloat"] = -145.54 + RI * 90.16 + Mg * 1.32 + Al * -4.5 + K * 0.78 + Ca * 0.06 + Ba * -9.19
    tipoCristal["buildWindNonFloat"] = -786.27 + RI * 519.68 + Mg * -0.4 + Al * -1.28 + K * 0.8 + Ca * -0.11 + Ba * 8.25
    tipoCristal["vehicWindFloat"] = 460.78 + RI * -316.05 + Mg * 1.76 + Al * -2.75 + K * -2.68 + Ca * 0.87
    tipoCristal["vehicWindNonFloat"] = -31.08 + Mg * 0.01 + Al * -0
    tipoCristal["containers"] = 871.16 + RI * -584.24 + Mg * -0.57 + Al * 4.56 + K * 0.86 + Ca * 1.09 + Ba * 2.46
    tipoCristal["tableware"] = -824.35 + RI * 553.91 + Mg * -0.21 + Al * 4.65 + K * -113.95 + Ca * -1.65 + Ba * -3.04
    tipoCristal["headlamps"] = -1444.01 + RI * 966.12 + Mg * -0.84 + Al * 0.36 + K * 1.46 + Ca * -2.49 + Ba * -7.47
    
    var claveMaxima = ""
    var valorMaximo = -100000.0

    for (clave, valor) in tipoCristal {
      if valor > valorMaximo {
        claveMaxima = clave
        valorMaximo = valor
      }
    }
    
    tipoCristal.removeAll()
    return claveMaxima
}

//TODO: IMPLEMENTAR ECUACIONES CORRECTAS (copy paste del 1)
/*Si Ba > 0.27*/
func hoja7(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["buildWindFloat"] = -145.54 + RI * 90.16 + Mg * 1.32 + Al * -4.5 + K * 0.78 + Ca * 0.06 + Ba * -9.19
    tipoCristal["buildWindNonFloat"] = -786.27 + RI * 519.68 + Mg * -0.4 + Al * -1.28 + K * 0.8 + Ca * -0.11 + Ba * 8.25
    tipoCristal["vehicWindFloat"] = 460.78 + RI * -316.05 + Mg * 1.76 + Al * -2.75 + K * -2.68 + Ca * 0.87
    tipoCristal["vehicWindNonFloat"] = -31.08 + Mg * 0.01 + Al * -0
    tipoCristal["containers"] = 871.16 + RI * -584.24 + Mg * -0.57 + Al * 4.56 + K * 0.86 + Ca * 1.09 + Ba * 2.46
    tipoCristal["tableware"] = -824.35 + RI * 553.91 + Mg * -0.21 + Al * 4.65 + K * -113.95 + Ca * -1.65 + Ba * -3.04
    tipoCristal["headlamps"] = -1444.01 + RI * 966.12 + Mg * -0.84 + Al * 0.36 + K * 1.46 + Ca * -2.49 + Ba * -7.47
    
    var claveMaxima = ""
    var valorMaximo = -100000.0

    for (clave, valor) in tipoCristal {
      if valor > valorMaximo {
        claveMaxima = clave
        valorMaximo = valor
      }
    }
    
    tipoCristal.removeAll()
    return claveMaxima
}
