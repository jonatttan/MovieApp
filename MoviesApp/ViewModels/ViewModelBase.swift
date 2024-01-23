//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 23/01/24.
//  Copyright © 2024 Jonattan Sousa. All rights reserved.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
