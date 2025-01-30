import AVFoundation
import SwiftUI

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    var backgroundPlayer: AVAudioPlayer?
    var losePlayer: AVAudioPlayer?
    var winPlayer: AVAudioPlayer?
    var bonusPlayer: AVAudioPlayer?
    var blockPlayer: AVAudioPlayer?
    
    
    @Published var backgroundVolume: Float = 0.5 {
        didSet {
            backgroundPlayer?.volume = backgroundVolume
            losePlayer?.volume = backgroundVolume
            winPlayer?.volume = backgroundVolume
        }
    }
    
    @Published var soundEffectVolume: Float = 1.0 {
        didSet {
            bonusPlayer?.volume = soundEffectVolume
            blockPlayer?.volume = soundEffectVolume
        }
    }
    
    init() {
        loadBackgroundMusic()
        loadWinMusic()
        loadLoseMusic()
        loadBonusMusic()
        loadBlockMusic()
    }
    
    private func loadBackgroundMusic() {
        if let url = Bundle.main.url(forResource: "bg", withExtension: "mp3") {
            do {
                backgroundPlayer = try AVAudioPlayer(contentsOf: url)
                backgroundPlayer?.numberOfLoops = -1
                backgroundPlayer?.volume = backgroundVolume
                backgroundPlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
    private func loadLoseMusic() {
        if let url = Bundle.main.url(forResource: "lose", withExtension: "mp3") {
            do {
                losePlayer = try AVAudioPlayer(contentsOf: url)
                losePlayer?.volume = backgroundVolume
                losePlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
    private func loadBlockMusic() {
        if let url = Bundle.main.url(forResource: "blockSound", withExtension: "wav") {
            do {
                blockPlayer = try AVAudioPlayer(contentsOf: url)
                blockPlayer?.volume = soundEffectVolume
                blockPlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
    private func loadWinMusic() {
        if let url = Bundle.main.url(forResource: "win", withExtension: "mp3") {
            do {
                winPlayer = try AVAudioPlayer(contentsOf: url)
                winPlayer?.volume = backgroundVolume
                winPlayer?.prepareToPlay()
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    
    private func loadBonusMusic() {
        if let url = Bundle.main.url(forResource: "bonus", withExtension: "wav") {
            do {
                bonusPlayer = try AVAudioPlayer(contentsOf: url)
                bonusPlayer?.prepareToPlay()
                bonusPlayer?.volume = soundEffectVolume
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
    func playBackgroundMusic() {
        backgroundPlayer?.play()
    }
    
    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
    }
    
    func playBonusdMusic() {
        bonusPlayer?.play()
    }
    
    func stopBonusMusic() {
        bonusPlayer?.stop()
    }
    
    func playLoseMusic() {
        losePlayer?.play()
    }
    
    func stopLoseMusic() {
        losePlayer?.stop()
    }
    
    func playWinMusic() {
        winPlayer?.play()
    }
    
    func stopWinMusic() {
        winPlayer?.stop()
    }
    
    func playBlockMusic() {
        blockPlayer?.play()
    }
    
    func stopBlockMusic() {
        blockPlayer?.stop()
    }
}
