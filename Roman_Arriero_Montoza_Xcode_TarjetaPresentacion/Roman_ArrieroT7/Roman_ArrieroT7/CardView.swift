//
//  CardView.swift
//  Roman_ArrieroT7
//
//  Created by user176695 on 01/11/2020.
//

import SwiftUI

struct CardView: View {
    
    @State var turnCard = false
    
    //para cambiar de color la tarjeta. hacer variable de estado para que cada vez que se modifique actualice algo en la pantalla.
    @State var color: Color = Color.blue
    //Array de colores
    var colors: [Color] = [.red, .pink, .green, .orange, .purple]
    
    @EnvironmentObject var personInfo: PersonInfo
    
    
    var body: some View {
        
        let flipDegrees = turnCard ? 180.0 : 0
        
        VStack{
            
            Text("Tu Tarjeta")
                .font(.title)
                .foregroundColor(.blue)
                .padding(.top, 40)
            
            HStack{
                //hacemos un forEach para usar el array de colores y oneColor es la variable que cambia segun el color. Con onTapGesture creamos un evento para al pulsar que seleccione el color.
                ForEach (colors, id: \.self){
                    oneColor in
                    Circle()
                        .frame(height: 40, alignment: .center)
                        .foregroundColor(oneColor)
                        .onTapGesture(count: 1, perform: {
                            self.color = oneColor
                        })
                }
              
            }.padding()
            
            ZStack() {
                VStack{
                    Text((personInfo.name) + (" ") + (personInfo.lastName)).padding(.leading, 55)
                    Text(personInfo.job)
                }
                .placedOnCard(color)
                .flipRotate(flipDegrees)
                .opacity(turnCard ? 0.0 : 1.0)
                
                HStack{
                    Circle()
                        .strokeBorder(Color.black,lineWidth: 1)
                        .background(Circle().foregroundColor(Color.white))
                        .frame(width: 60, height: 60, alignment: .center)
                        .alignmentGuide(HorizontalAlignment.leading) { dimension in return 130 }
                        .flipRotate(flipDegrees)
                        .opacity(turnCard ? 0.0 : 1.0)
                        .alignmentGuide(VerticalAlignment.center) { dimension in return 30 }
                        .padding(.trailing, 210)
                }
                    
                    HStack{
                        //para sacar la inicial del nombre.
                    if personInfo.name.isEmpty == false{
                        let index = personInfo.name.index(personInfo.name.startIndex, offsetBy: 1)
                        let inicial: String = personInfo.name.substring(to: index)
                        Text(inicial)
                    }
                        
                    }
                    .font(.title3)
                    .padding(.trailing, 210)
                    
                
                
                VStack{
                    HStack{
                        Image(systemName: "phone")
                        Text(personInfo.phone)
                    }
                    HStack{
                        Image(systemName: "mail")
                        Text(personInfo.email)
                    }
                    HStack{
                        Image(systemName: "house")
                        Text(personInfo.adress)
                    }
                }.placedOnCard(color)
                .flipRotate(-180 + flipDegrees)
                .opacity(turnCard ? 1.0 : 0.0)
            }
            .animation(.easeInOut(duration: 0.8))
            .onTapGesture { self.turnCard.toggle() }
            
            Spacer()
        }
    }
    
}

extension View {
    
    func flipRotate(_ degrees : Double) -> some View {
        return rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0, y: 0.0, z: 0.0))
    }
    
    func placedOnCard(_ color: Color) -> some View {
        return padding(5)
            .frame(width: 300, height: 200, alignment: .center)
            .background(color)
            .cornerRadius(20.0)
    }
    
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
