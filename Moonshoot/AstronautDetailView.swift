//
//  AstronautDetailView.swift
//  Moonshoot
//
//  Created by Harish on 28/12/22.
//

import SwiftUI

struct AstronautDetailView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautDetailView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautDetailView(astronaut: astronauts["white"]!)
            .preferredColorScheme(.dark)
    }
}
