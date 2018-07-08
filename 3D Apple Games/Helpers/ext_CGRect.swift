import UIKit

// extensions - CGRect
extension CGRect: ExpressibleByArrayLiteral {
    
    // rect = [10, 10, 40, 30]
    public init(arrayLiteral elements: CGFloat...) {
        assert(elements.count >= 4, "CGRect needs: x, y, width, height.")
        self.init(x: elements[0], y: elements[1], width: elements[2], height: elements[3])
    }
    
    // get: rect.center
    // set: rect.center = [10, 20]
    public var center: CGPoint {
        get { return [midX, midY] }
        set (newCenter) { origin += newCenter - center }
    }
    
}
