//
//  Prueba.swift
//  Roman_ArrieroT7
//
//  Created by user176695 on 01/11/2020.
//

import SwiftUI

struct SimpleFlipper : View {
      @State var flipped = false

      var body: some View {
        
        @EnvironmentObject var personInfo: PersonInfo

            let flipDegrees = flipped ? 180.0 : 0

            return VStack{
                  Spacer()

                  ZStack() {
                    Text(personInfo.name).placedOnCard(Color.yellow).flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
                    Text(personInfo.lastName).placedOnCard(Color.blue).flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
                  }
                  .animation(.easeInOut(duration: 0.8))
                  .onTapGesture { self.flipped.toggle() }
                  Spacer()
            }
      }
}

extension View {

      func flipRotate(_ degrees : Double) -> some View {
            return rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0, y: 0.0, z: 0.0))
      }

      func placedOnCard(_ color: Color) -> some View {
            return padding(5).frame(width: 250, height: 150, alignment: .center).background(color)
      }
}

struct Prueba_Previews: PreviewProvider {
    static var previews: some View {
        SimpleFlipper()
    }
}
