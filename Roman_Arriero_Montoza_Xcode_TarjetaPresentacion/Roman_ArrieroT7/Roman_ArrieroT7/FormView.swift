//
//  FormView.swift
//  Roman_ArrieroT7
//
//  Created by user176695 on 01/11/2020.
//

import SwiftUI

struct FormView: View {
    
    @EnvironmentObject var personInfo: PersonInfo
    
    var body: some View {
        
        Form {
            Text("Tus Datos")
                .font(.title)
                .foregroundColor(.blue)
                .padding(.horizontal, 90)
            
            TextField("Nombre...", text: $personInfo.name)
            TextField("Apellidos...", text: $personInfo.lastName)
            TextField("Puesto de Trabajo...", text: $personInfo.job)
            
            Section{
                TextField("Telefono...", text: $personInfo.phone)
                TextField("Correo Electronico...", text: $personInfo.email)
                TextField("Dirección...", text: $personInfo.adress)
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
