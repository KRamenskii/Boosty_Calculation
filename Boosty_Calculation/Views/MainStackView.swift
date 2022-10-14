//
//  MainStackView.swift
//  Boosty_Calculation
//
//  Created by Кирилл Раменский on 14.10.2022.
//

import UIKit

class MainStackView: UIStackView {
    
    private var stackViewsArray = [UIStackView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMainStackView()
        configure()
        stackViewsArray.forEach { addArrangedSubview($0) }
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func createButton(title: String, tag: Int, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tag = tag
        button.backgroundColor = color
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(keyboardButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc private func keyboardButtonTapped(sender: UIButton) {
        print(sender.tag)
    }
    
    private func configure() {
        axis = .vertical
        spacing = 1
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMainStackView() {
        let buttonZero = createButton(title: "0", tag: 0, color: .gray)
        let buttonPoint = createButton(title: ",", tag: 10, color: .gray)
        let buttonEqual = createButton(title: "=", tag: 11, color: .orange)
        let firstStackView = UIStackView(subviews: [buttonZero, buttonPoint, buttonEqual])
        buttonZero.widthAnchor.constraint(equalTo: firstStackView.widthAnchor, multiplier: 0.5).isActive = true
        buttonPoint.widthAnchor.constraint(equalTo: buttonEqual.widthAnchor, multiplier: 1).isActive = true
        firstStackView.distribution = .fill
        
        let buttonOne = createButton(title: "1", tag: 1, color: .gray)
        let buttonTwo = createButton(title: "2", tag: 2, color: .gray)
        let buttonThree = createButton(title: "3", tag: 3, color: .gray)
        let buttonPlus = createButton(title: "=", tag: 12, color: .orange)
        let secondStackView = UIStackView(subviews: [buttonOne, buttonTwo, buttonThree, buttonPlus])
        
        let buttonFour = createButton(title: "4", tag: 4, color: .gray)
        let buttonFive = createButton(title: "5", tag: 5, color: .gray)
        let buttonSix = createButton(title: "6", tag: 6, color: .gray)
        let buttonMinus = createButton(title: "-", tag: 13, color: .orange)
        let thirdStackView = UIStackView(subviews: [buttonFour, buttonFive, buttonSix, buttonMinus])
        
        let buttonSeven = createButton(title: "7", tag: 7, color: .gray)
        let buttonEight = createButton(title: "8", tag: 8, color: .gray)
        let buttonNine = createButton(title: "9", tag: 9, color: .gray)
        let buttonMulti = createButton(title: "×", tag: 14, color: .orange)
        let fourthStackView = UIStackView(subviews: [buttonSeven, buttonEight, buttonNine, buttonMulti])
        
        let buttonAC = createButton(title: "AC", tag: 18, color: .darkGray)
        let buttonPlusMinus = createButton(title: "±", tag: 17, color: .darkGray)
        let buttonPercent = createButton(title: "%", tag: 16, color: .darkGray)
        let buttonDivision = createButton(title: "÷", tag: 15, color: .orange)
        let fifthStackView = UIStackView(subviews: [buttonAC, buttonPlusMinus, buttonPercent, buttonDivision])
        
        stackViewsArray = [fifthStackView, fourthStackView, thirdStackView, secondStackView, firstStackView]
    }
}
