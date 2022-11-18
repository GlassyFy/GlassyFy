//
//  SwiftUIView.swift
//  GlassyFy
//
//  Created by Aula11 on 11/11/22.
//

import Foundation
import CoreData
import UIKit

class ViewModel: ObservableObject {
    let gestorCoreData = CoreDataManager.instance //singleton (1 sola instancia)

    @Published var personasArray: [PersonaEntity] = []
    @Published var mascotasArray: [MascotaEntity] = []
    
    init(){
        cargarDatos()
        //addPersona(nombre: "Lolita", foto: UIImage(systemName: "person")!)
        //addPersona(nombre: "Cinthya", foto: UIImage(systemName: "person.fill")!)
    }
    
    func cargarDatos(){
        personasArray.removeAll()
        mascotasArray.removeAll()
        let fetchPersonas = NSFetchRequest<PersonaEntity>(entityName: "PersonaEntity")
        let fetchMascotas = NSFetchRequest<MascotaEntity>(entityName: "MascotaEntity")
        do{
            self.personasArray = try gestorCoreData.contexto.fetch(fetchPersonas).sorted(){$0.nombre! < $1.nombre!}
            self.mascotasArray = try gestorCoreData.contexto.fetch(fetchMascotas).sorted(){$0.nombre! < $1.nombre!}
        }catch let error{
            print("Error al cargar los datos: \(error)")
        }
    }
    
    func guardarDatos(){   //no eficiente, pero hay pocos datos
        gestorCoreData.save()
        cargarDatos()
    }
    
    func addPersona(nombre: String, foto: UIImage){
        let nuevaPersona = PersonaEntity(context: gestorCoreData.contexto)
        nuevaPersona.nombre = nombre
        nuevaPersona.foto = foto.pngData()
        guardarDatos()
    }

    func deletePersona(indexSet: IndexSet){
        for index in indexSet{  //podrÌa eliminar varios a lavez
            gestorCoreData.contexto.delete(personasArray[index])
        }
        guardarDatos()
    }
    
    func addMascota(persona: PersonaEntity, nombre: String, edad: Int16, raza: String){
        let nuevaMascota = MascotaEntity(context: gestorCoreData.contexto)
        nuevaMascota.nombre = nombre
        nuevaMascota.edad = edad
        nuevaMascota.raza = raza
        nuevaMascota.personasRelation = persona   // atributo de relaciÛn
        guardarDatos()
    }
    
    func deleteMascota(mascota: MascotaEntity){
        gestorCoreData.contexto.delete(mascota)
        guardarDatos()
    }
}

