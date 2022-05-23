//
//  NYSchoolsViewModel.swift
//  20220520-JaeCho-NYCSchools
//
//  Created by Jae Cho on 5/22/22.
//

import Foundation
import SwiftUI
import Combine




class NYSchoolsViewModel: ObservableObject {
	//Variable to hold the retrieved school information in an array of School
	//Since network calls are deemed more expensive than processing the information locally, will retrieve all the needed information and store them first.
	//All filtering will be done locally based on this data.
	@Published var fetchedSchools : [School] = []
	@Published var fetchedSAT : [SATScore] = []
	
	//This function uses JSONDecoder to retrieve the school information and store
	func fetchSchools(){
		guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else { return }
		let session = URLSession(configuration: .default)
		session.dataTask(with: url ) { (data, _, err) in
			if let error = err {
				print(error.localizedDescription)
				return
			}
			guard let APIData = data else {
				print("no data found")
				return
			}
			
			do{
				let schools = try JSONDecoder().decode([School].self, from: APIData)
				DispatchQueue.main.async {
					self.fetchedSchools.append(contentsOf: schools)
				}
			} catch {
				print(error.localizedDescription)
			}
		}
		.resume()
	}
	
	func fetchSATScores(){
		guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else { return }
		let session = URLSession(configuration: .default)
		session.dataTask(with: url ) { (data, _, err) in
			if let error = err {
				print(error.localizedDescription)
				return
			}
			guard let APIData = data else {
				print("no data found")
				return
			}
			
			do{
				let scores = try JSONDecoder().decode([SATScore].self, from: APIData)
				DispatchQueue.main.async {
					self.fetchedSAT.append(contentsOf: scores)
				}
			} catch {
				print(error.localizedDescription)
			}
		}
		.resume()
	}
	
	func getSATScore(forSchoolWithDBN dbn: String ) -> SATScore? {
		for school in self.fetchedSAT{
			if school.dbn == dbn {
				return school
			}
		}
		return nil
	}
}
