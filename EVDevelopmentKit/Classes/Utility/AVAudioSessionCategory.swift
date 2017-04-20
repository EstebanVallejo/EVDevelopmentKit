//
//  AVAudioSessionCategory.swift
//  Wuzhear
//
//  Created by Steve on 4/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation
import AVFoundation

public enum AVAudioSessionCategory {
  
  case ambient
  case soloAmbient
  case playAndRecord
  case playback
  case record
  
  var rawValue: String {
    
    switch self {
    case .ambient: return AVAudioSessionCategoryAmbient
    case .soloAmbient: return AVAudioSessionCategorySoloAmbient
    case .playAndRecord: return AVAudioSessionCategoryPlayAndRecord
    case .playback: return AVAudioSessionCategoryPlayback
    case .record: return AVAudioSessionCategoryRecord
    }
    
  }
}
