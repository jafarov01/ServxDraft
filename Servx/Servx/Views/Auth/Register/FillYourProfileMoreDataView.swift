//
//  FillYourProfileMoreDataView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 13/01/2024.
//

import SwiftUI

struct FillYourProfileMoreDataView: View {
    
    @ObservedObject var viewModel = FillYourProfileMoreDataViewViewModel()
    
    let educationOptions = ["No Formal Education", "Primary Education", "Secondary Education", "Bachelor's Degree", "Professional Certification", "Others"]
    let languageOptions = ["English", "Russian", "Hungarian", "German", "Spanish"]
    let serviceMainCategory = ServxStaticData.serviceCategories.map { $0.name }
    let serviceSubCategory = ServxStaticData.serviceCategories.flatMap { category in
        category.subcategories.map { $0.name }
    }
    let workExperienceOptions = ["1-3 years", "3-5 years", "5-10 years", "10+ years", "No experience"]
    
    var filteredSubCategories: [String] {
        if let selectedCategory = ServxStaticData.serviceCategories.first(where: { $0.name == viewModel.selectedServiceArea }) {
            return selectedCategory.subcategories.map { $0.name }
        } else {
            return []
        }
    }
    
    var body: some View {
        Form {
            Picker("Education", selection: $viewModel.selectedEducation) {
                ForEach(educationOptions, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .padding(20)
            
            Picker("Language", selection: $viewModel.selectedLanguage) {
                ForEach(languageOptions, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .padding(20)
            
            
            Picker("Main Service Area", selection: $viewModel.selectedServiceArea) {
                ForEach(serviceMainCategory, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .padding(20)
            
            Picker("Subcategory service area", selection: $viewModel.selectedServiceSubcategory) {
                ForEach(filteredSubCategories, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .padding(20)
            
            Picker("Work Experience", selection: $viewModel.selectedWorkExperience) {
                ForEach(workExperienceOptions, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .padding(20)
            
            ServxButtonView(height: 56, width: 342, handler: {
                viewModel.updateUserData()
            }, label: "Continue", textColor: .white, backgroundColor: Color("primary500Color"))
            
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .cornerRadius(8)
        }
        .navigationBarTitle("Fill Your Profile", displayMode: .inline)
        .navigationDestination(isPresented: $viewModel.successSave, destination: {
            MainBottomNavBar()
        })
    }
}

struct ProfileFormView_Previews: PreviewProvider {
    static var previews: some View {
        FillYourProfileMoreDataView()
    }
}
