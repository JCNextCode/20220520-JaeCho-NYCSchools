//
//  ContentView.swift
//  20220520-JaeCho-NYCSchools
//
//  Created by Jae Cho on 5/20/22.
//

import SwiftUI
//Using 3rd Party Package to make the GridView more interesting.
import WaterfallGrid

struct ContentView: View {
	
	//Contains the array of schools created from JSON.
	@StateObject var schoolData = NYSchoolsViewModel()
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
	
	var body: some View {
		NavigationView{
			ScrollView() {
				if schoolData.fetchedSchools.isEmpty{
					ProgressView()
						.padding(.top,30)
				}else{
					VStack(){
						//Using 3rd Party GridLayout
						//More improvements in UI using WaterfallGrid can be done but leaving it as a future enhancement.
							WaterfallGrid(schoolData.fetchedSchools, id: \.self) { school in
								
								NavigationLink{
									DetailsView(score: schoolData.getSATScore(forSchoolWithDBN: school.dbn))
								} label: {
									SchoolConciseView(school: school)
								}
								.padding()
							}
							.gridStyle(
								columnsInPortrait: 1, columnsInLandscape: 3, spacing: 2, animation: .easeInOut(duration: 0.5)
							)
							
						//}
					}
				}
			}
			.navigationTitle("NY Schools Data")
			//.background(.lightBackground)
			.preferredColorScheme(.light)
			.background(
				Image("background")
					.scaledToFit()
					.ignoresSafeArea()
					.opacity(0.1)
			)
		}
		.onAppear(){
			//Since network calls are deemed more expensive than processing the information locally, will retrieve all the needed information and store them first.
			//All filtering will be done locally based on this data.
			if schoolData.fetchedSchools.isEmpty{
				schoolData.fetchSchools()
			}
			if schoolData.fetchedSAT.isEmpty{
				schoolData.fetchSATScores()
			}
		}
	}
}

struct SchoolConciseView: View{
	@State var school : School
	
	var body: some View{
		
		VStack{
			Group{
				Text(school.school_name)
					.font(.system(size: 20))
					.fontWeight(.bold)
					.foregroundColor(.indigo)
				//Text(school.location)
					.font(.system(size: 12))
			}
			.font(.caption)
			.foregroundColor(.black)
			Group{
				Text(school.phone_number)
				Text(school.formattedEmail)
				Text(school.formattedWebsite)
			}
			.font(.system(size: 10))
			.foregroundColor(.blue)
			LineSeparatorView()
		}

	}
}

struct LineSeparatorView : View {
	
	var body : some View {
		Rectangle()
			.frame(height:2)
			.foregroundColor(.gray)
			.padding(.vertical)
	}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		 ContentView()
    }
}
