//
//  SATScore.swift
//  20220520-JaeCho-NYCSchools
//
//  Created by Jae Cho on 5/23/22.
//

import Foundation

/**
Struct School
 dbn : using as the unique index value of each entry.
 
 */
struct SATScore: Codable, Hashable{
	var dbn: String
	var school_name : String
	var num_of_sat_test_takers : String
	var sat_critical_reading_avg_score : String
	var sat_math_avg_score : String
	var sat_writing_avg_score : String
}
