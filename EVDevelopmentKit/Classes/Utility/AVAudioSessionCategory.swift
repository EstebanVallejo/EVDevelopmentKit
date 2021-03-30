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
    case .ambient: return AVAudioSession.Category.ambient.rawValue
    case .soloAmbient: return AVAudioSession.Category.soloAmbient.rawValue
    case .playAndRecord: return AVAudioSession.Category.playAndRecord.rawValue
    case .playback: return AVAudioSession.Category.playback.rawValue
    case .record: return AVAudioSession.Category.record.rawValue
    }
    
  }
}
