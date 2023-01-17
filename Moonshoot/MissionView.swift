//
//  MissionView.swift
//  Moonshoot
//
//  Created by Harish on 28/12/22.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding([.top, .bottom])
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height:2)
                            .foregroundColor(.lightBackground)
                        
                        Text("Mission Highlights")
                            .font(.title)
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                            .padding(.bottom)
                        
                        Rectangle()
                            .frame(height:2)
                            .foregroundColor(.lightBackground)
                        
                        Text("Crew")
                            .font(.title)
                            .padding(.bottom, 5)
                        
                    }
                    .padding([.horizontal])
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(crew, id: \.role) { member in
                                NavigationLink {
                                    AstronautDetailView(astronaut: member.astronaut)
                                } label: {
                                    Image(member.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading) {
                                        Text(member.astronaut.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text(member.role)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        .padding([.horizontal])
                    }
                }
                .padding([.bottom])
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        //Create(map) a crewmember against crew in our mission.
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Astronaut \(member.name) is not found")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
