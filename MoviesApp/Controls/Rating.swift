//
//  Rating.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 22/01/24.
//

import SwiftUI

struct Rating: View {
    
    @Binding var rating: Int?
    
    private func starType(index: Int) -> String {
        
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
        
    }
    
    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating
                    }
            }
        }
    }
}


struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        Rating(rating: .constant(5))
    }
}
