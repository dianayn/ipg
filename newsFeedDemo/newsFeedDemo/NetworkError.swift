//
//  NetworkError.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 20/3/20.
//  Copyright © 2020 diana. All rights reserved.
//

import Foundation

enum NetworkError: Error {
  //
  // MARK: - Cases
  //
  case dateParseError
  case invalidPath
  case parseError
  case requestError
}
