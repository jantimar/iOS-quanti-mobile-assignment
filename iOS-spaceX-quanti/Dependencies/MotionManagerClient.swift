//
//  MotionManagerClient.swift
//  iOS-spaceX-quanti
//
//  Created by Jan Timar on 13.01.2025.
//

import Foundation
import ComposableArchitecture

struct MotionManagerClient {
    
}

extension MotionManagerClient: DependencyKey {
    static var liveValue: MotionManagerClient {
        MotionManagerClient(

        )
    }
}

extension DependencyValues {
    var motion: MotionManagerClient {
        get { self[MotionManagerClient.self] }
        set { self[MotionManagerClient.self] = newValue }
    }
}

import CoreMotion
import Combine

private final class MotionManager {
    let accelerometerPublisher = PassthroughSubject<CMAccelerometerData, Never>()

    private let motionManager: CMMotionManager

    init(motionManager: CMMotionManager = .init()) {
        self.motionManager = motionManager

    }

    func start() {
        guard motionManager.isDeviceMotionAvailable else { return }
        motionManager.startDeviceMotionUpdates()
    }

    func stop() {
        motionManager.stopDeviceMotionUpdates()
    }

}
