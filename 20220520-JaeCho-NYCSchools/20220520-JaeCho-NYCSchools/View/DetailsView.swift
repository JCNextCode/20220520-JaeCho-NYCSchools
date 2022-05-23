//
//  DetailsView.swift
//  20220520-JaeCho-NYCSchools
//
//  Created by Jae Cho on 5/23/22.
//

import SwiftUI

//This View shows the details of the SAT score

struct DetailsView: View {
	
	var score : SATScore?
	
    var body: some View {
		 GeometryReader{ geometry in
			 ScrollView{
				 if score == nil {
					 Text("No data available")
				 }else{
					 VStack{
						 Text(score!.school_name)
								 .font(.system(size: 20))
								 .fontWeight(.bold)
								 .foregroundColor(.indigo)
						 
						 LineSeparatorView()
						 	 HStack{
								 VStack(alignment:.leading){
									 Text(" Number of SAT Test Takers ")
									 Text(" SAT Critical Reading Avg. Score ")
									 Text(" SAT Math Avg. Score ")
									 Text(" SAT Writing Avg. Score ")
								 }
								 .font(.system(size: 15))
								 .font(.caption)
								 .foregroundColor(.black)
								 
								 VStack(alignment:.leading){
									 Text(" - ")
									 Text(" - ")
									 Text(" - ")
									 Text(" - ")
								 }
								 
								 VStack(alignment:.trailing){
									 Text(score!.num_of_sat_test_takers)
									 Text(score!.sat_critical_reading_avg_score)
									 Text(score!.sat_math_avg_score)
									 Text(score!.sat_writing_avg_score)
								 }
								 .font(.system(size: 15))
								 .foregroundColor(.red)
								 
							 }

					 }
				 }
			 }
		 
		 }
		 .background(
			 Image("background")
				 .scaledToFit()
				 .ignoresSafeArea()
				 .opacity(0.1)
		 )
    }
}
