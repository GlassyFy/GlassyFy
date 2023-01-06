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
                if (Mg <= 3.45){
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
    tipoCristal["Cristal flotado"] = -145.54 + RI * 90.16 + Mg * 1.32 + Al * -4.5 + K * 0.78 + Ca * 0.06 + Ba * -9.19
    
    tipoCristal["Cristal no flotado"] = -786.27 + RI * 519.68 + Mg * -0.4 + Al * -1.28 + K * 0.8 + Ca * -0.11 + Ba * 8.25
    
    tipoCristal["Parabrisas flotado"] = 460.78 + RI * -316.05 + Mg * 1.76 + Al * -2.75 + K * -2.68 + Ca * 0.87
    
    tipoCristal["Parabrisas no flotado"] = -31.08 + Mg * 0.01 + Al * -0
    
    tipoCristal["Cristal de recipiente"] = 871.16 + RI * -584.24 + Mg * -0.57 + Al * 4.56 + K * 0.86 + Ca * 1.09 + Ba * 2.46
    
    tipoCristal["Cristal de vajilla"] = -824.35 + RI * 553.91 + Mg * -0.21 + Al * 4.65 + K * -113.95 + Ca * -1.65 + Ba * -3.04
    
    tipoCristal["Cristal de faro"] = -1444.01 + RI * 966.12 + Mg * -0.84 + Al * 0.36 + K * 1.46 + Ca * -2.49 + Ba * -7.47
    
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
    tipoCristal["Cristal flotado"] = 87436.25 + RI * -57673.49 + Mg * -0.3 + Al * -3.22 + K * 8.39 + Ca * -0.27 + Ba * -11.98
    
    tipoCristal["Cristal no flotado"] = -14792.07 + RI * 9815.19 + Mg * 0.83 + Al * -67.56 + K * -10.17 + Ca * -0.32 + Ba * -7.98
    
    tipoCristal["Parabrisas flotado"] = 6100.72 + RI * -4073.23 + Mg * 1.52 + Al * 10.93 + K * -3.71 + Ca * 7.25 + Ba * 1.81
    
    tipoCristal["Parabrisas no flotado"] = -51.65 + Mg * 0.01 + Al * -0
    
    tipoCristal["Cristal de recipiente"] = 17.53 + RI * -38.05 + Mg * -1.25 + Al * 3.98 + K * 0.49 + Ca * 0.46 + Ba * 2.46
    
    tipoCristal["Cristal de vajilla"] = 154.89 + RI * -118.9 + Mg * -0.21 + Al * 3.9  + K * -112.96 + Ca * -0.54 + Ba * -3.04

    
    tipoCristal["Cristal de faro"] = -3733.18 + RI * 2457.43 + Mg * -6 + Al * 0.36 + K * 29.99 + Ca * -1.31 + Ba * 1.62
    
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

/*Si Ba  <= 0.27 && Mg > 2.41 && Al <= 1.41 && RI > 1.51707 && K <= 0.23 */
func hoja3(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["Cristal flotado"] = 124.97 + RI * -78.58 + Mg * 1.28 + Al * -3.05 + K * -4.5 + Ca * -0.28 + Ba * -23.86
    
    tipoCristal["Cristal no flotado"] = -815.23 + RI * 619.01 + Mg * -36.66 + Al * -3.17 + K * 7.46 + Ca * -0.02 + Ba * -7.98
    
    tipoCristal["Parabrisas flotado"] = 1151 + RI * -753.53 + Mg * 1.77 + Al * -4.44 + K * -3.4 + Ca * -0.46 + Ba * 19.21
    
    tipoCristal["Parabrisas no flotado"] = -61.93 + Mg * 0.01 + Al * -0

    tipoCristal["Cristal de recipiente"] = 7.24 + RI * -38.05 + Mg * -1.25 + Al * 3.98 + K * 0.49 + Ca * 0.46 + Ba * 2.46
    
    tipoCristal["Cristal de vajilla"] = 144.61 + RI * -118.9 + Mg * -0.21 + Al * 3.9  + K * -112.96 + Ca * -0.54 + Ba * -3.04
    
    tipoCristal["Cristal de faro"] = -5209.15 + RI * 3431.78 + Mg * -10.39 + Al * 0.36 + K * 45.07 + Ca * -1.31 + Ba * 1.62
    
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

/*Si Ba  <= 0.27 && Mg > 2.41 && Al <= 1.41 && RI > 1.51707 && K > 0.23 */
func hoja4(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["Cristal flotado"] = 728.29 + RI * -459.52 + Mg * -5.69 + Al * 4.94 + K * 5.37 + Ca * -1.98 + Ba * 2.64
    
    tipoCristal["Cristal no flotado"] = -1617.23 + RI * 1054.98 + Mg * 5.41 + Al * -6.64 + K * -11.03 + Ca * 1.43 + Ba * -22.61
    
    tipoCristal["Parabrisas flotado"] = 1245.5 + RI * -827.3 + Mg * 0.61 + Al * -4.27 + K * -11.8 + Ca * 0.83 + Ba * 13.29
    
    tipoCristal["Parabrisas no flotado"] = -61.93 + Mg * 0.01 + Al * -0
    
    tipoCristal["Cristal de recipiente"] = 7.24 + RI * -38.05 + Mg * -1.25 + Al * 3.98 + K * 0.49 + Ca * 0.46 + Ba * 2.46
    
    tipoCristal["Cristal de vajilla"] = 144.61 + RI * -118.9 + Mg * -0.21 + Al * 3.9  + K * -112.96 + Ca * -0.54 + Ba * -3.04
    
    tipoCristal["Cristal de faro"] = -9775.23 + RI * 6415.58 + Mg * -14.54 + Al * 0.36 + K * 132.96 + Ca * -1.31 + Ba * 1.62
    
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

/*Si Ba  <= 0.27 && Mg > 2.41 && Al > 1.41 && Ca <= 3.45 */
func hoja5(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["Cristal flotado"] = 727.54 + RI * -493.91 + Mg * 3.48 + Al * -4.86 + K * -0.36 + Ca * 0.82 + Ba * -22.55
    
    tipoCristal["Cristal no flotado"] = 70.65 + RI * 41.45 + Mg * -12.14 + Al * -19.31 + K * -4.32 + Ca * -6.88 + Ba * 8.25
    
    tipoCristal["Parabrisas flotado"] = -275.01 + RI * 58.48 + Mg * 16.96 + Al * 21.12 + K * 1.37 + Ca * 11.22 + Ba * 1.81
    
    tipoCristal["Parabrisas no flotado"] = -51.65 + Mg * 0.01 + Al * -0
    
    tipoCristal["Cristal de recipiente"] = 17.53 + RI * -38.05 + Mg * -1.25 + Al * 3.98 + K * 0.49 + Ca * 0.46 + Ba * 2.46
    
    tipoCristal["Cristal de vajilla"] = 154.89 + RI * -118.9 + Mg * -0.21 + Al * 3.9  + K * -112.96 + Ca * -0.54 + Ba * -3.04
    
    tipoCristal["Cristal de faro"] = -2820.83 + RI * 1845.88 + Mg * -1.05 + Al * 0.36 + K * 13.17 + Ca * -1.31 + Ba * 1.62
    
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
//TODO: CORREGIR ESTA HOJA PQ PARECE QUE DA FALLOS
/*Si Ba  <= 0.27 && Mg > 2.41 && Al > 1.41 && Ca > 3.45 */
func hoja6(RI: Double, Mg: Double, Al: Double, K: Double, Ca: Double, Ba: Double) -> String {
    tipoCristal["Cristal flotado"] = 1312.41 + RI * -880.94 + Mg * -0.29 + Al * -4.62 + K * -1.24 + Ca * 4.07 + Ba * -37.59
    
    tipoCristal["Cristal no flotado"] = -624.35 + RI * 431.01 + Mg * 2.29 + Al * -4.14 + K * 4.5  + Ca * -3.9 + Ba * 23.09
    
    tipoCristal["Parabrisas flotado"] = 37.03 + RI * -85.69 + Mg * 4.76 + Al * 5.66 + K * -3.1 + Ca * 6.83 + Ba * 1.81
    
    tipoCristal["Parabrisas no flotado"] = -51.65 + Mg * 0.01 + Al * -0
    
    tipoCristal["Cristal de recipiente"] = 17.53 + RI * -38.05 + Mg * -1.25 + Al * 3.98 + K * 0.49 + Ca * 0.46 + Ba * 2.46
    
    tipoCristal["Cristal de vajilla"] = 154.89 + RI * -118.9 + Mg * -0.21 + Al * 3.9  + K * -112.96 + Ca * -0.54 + Ba * -3.04
    
    tipoCristal["Cristal de faro"] = -2820.83 + RI * 1845.88 + Mg * -1.05 + Al * 0.36 + K * 13.17 + Ca * -1.31 + Ba * 1.62
    
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
    tipoCristal["Cristal flotado"] = -103.78 + RI * 90.07 + Mg * 3.08 + Al * -19.31 + K * 0.3  + Ba * -11.22
    
    tipoCristal["Cristal no flotado"] = -276.97 + RI * 158.76 + Mg * 0.28 + Al * -0.38 + K * 0.47 + Ca * 2.43 + Ba * 4.83
    
    tipoCristal["Parabrisas flotado"] = 195.39 + RI * -137.22 + Mg * 1.1  + Al * -2.5 + K * -1.77 + Ca * 0.34
    
    tipoCristal["Parabrisas no flotado"] = -20.79 + Mg * 0.01 + Al * -0
    
    tipoCristal["Cristal de recipiente"] = -54.49 + Mg * -0.67 + Al * 15.15 + K * 3.08 + Ca * 0.37 + Ba * 4.04
    
    tipoCristal["Cristal de vajilla"] = 174.85 + RI * -118.9 + Mg * -0.32 + K * -22.56 + Ca * -0.22 + Ba * -3.04
    
    tipoCristal["Cristal de faro"] = 121.08 + RI * -66.07 + Mg * -2.54 + Al * -1.06 + Ca * -0.9 + Ba * -1.17
    
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
