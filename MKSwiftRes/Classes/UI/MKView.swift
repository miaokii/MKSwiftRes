//
//  MKView.swift
//  MKSwiftRes
//
//  Created by miaokii on 2021/1/28.
//

import Foundation

public class MKView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func setup() {}
    public func set(model: Any) {}
}
