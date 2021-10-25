//
//  MakeTenViewController.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 31/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit
import KTCenterFlowLayout

class MakeTenViewController: UIViewController {
  //MARK: - Storyboard objects
  @IBOutlet weak var dropDownView: UIView!
  @IBOutlet weak var dropDownBottomConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var resultLabel: UILabel!
  
  @IBOutlet weak var modeButton: UIButton!
  @IBOutlet weak var streakButton: UIButton!
  @IBOutlet weak var pauseButton: UIButton!
  
  @IBOutlet weak var customButtom: RoundedButton!
  @IBOutlet weak var randomButton: RoundedButton!
  
  @IBOutlet weak var numbersCollectionView: UICollectionView!
  @IBOutlet weak var operationsCollectionView: UICollectionView!
  lazy var collections = [numbersCollectionView, operationsCollectionView]
  
  //MARK: - Parameters
  lazy var timeManager = TimeManager(with: timerLabel)
  var gameManager = GameManager()
//  var flowLayout = KTCenterFlowLayout()
  var flowLayout = UICollectionViewFlowLayout()
//  lazy var viewBackground = Gradient(superView: view)
  
  var numberTap: UITapGestureRecognizer!
  var numberDrag: UILongPressGestureRecognizer!
  var operationTap: UITapGestureRecognizer!
  var operationDrag: UILongPressGestureRecognizer!
  var dragStartPoint: CGPoint!
  var dragEndPoint: CGPoint!
  var sourceIndex: Int?
  var cameFromNumbers = false
  var cameFromOperations = false

  var playButtonOverlay = UIButton()
  var blurView = UIVisualEffectView()
  
  var menuDropped = 0
  var gameInProgress = false
  var result: Double?
  
  //MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpCollectionViews()
    setUpGestureRecognizers()
    
//    DispatchQueue.main.async {
//      self.viewBackground.add(to: self.view)
//      self.viewBackground.add(to: self.tabBarController!.tabBar)
//      self.viewBackground.add(to: self.customButtom)
//      self.viewBackground.add(to: self.randomButton)
//    }
  }
  
  override func viewDidLayoutSubviews() {
    recurringSetupForNumbers()
    recurringSetupForOperations()
  }
  
  //MARK: - Actions
  @IBAction func navButtonClicked(_ sender: UIButton) {
    switchMenu(for: sender)
//    showMenu(for: sender.tag, in: dropDownView)
  }
  
  @IBAction func pauseButtonClicked(_ sender: UIButton) {
    if gameInProgress {
      timeManager.stopTimer()
      blurBackground()
      gameInProgress = false
    } else {
      timeManager.startTimer()
      makeBackgroundVisible()
      gameInProgress = true
    }
    updatePauseButton()
  }
  
  @IBAction func customButtonClicked(_ sender: UIButton) {
    timeManager.stopTimer()
    requestCustomInput()
  }
  
  @IBAction func randomButtonClicked(_ sender: UIButton) {
    resetGame()
    selectNewNumbers()
    timeManager.startTimer()
    updatePauseButton()
  }
  
  func resetButtonClicked() {
    gameManager.numbersArray = gameManager.numbersArray.clean()
    numbersCollectionView.reloadData()
  }
  
  func checkButtonClicked() {
    do {
      result = try Calculator.evaluate(gameManager.numbersForCalc)
      result == 10.0 ? timeManager.stopTimer() : nil
      let response = ResponseManager.provideCustomFeedback(for: result ?? 0)
      resultLabel.text = "\(response) You made: \(result?.round(to: 2) ?? 0.00)"
    } catch {
      let err = ErrorManager.customOutput(for: error)
      let alert = UIAlertController(title: "Error", message: err, preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .default, handler: nil)
      alert.addAction(action)
      present(alert, animated: true)
    }
  }
  
  //MARK: - Views
  fileprivate func setUpPlayButtonOverlay() {
    playButtonOverlay.sizeToFit()
    let imageWidth: CGFloat = super.view.bounds.width / 3
    let imageHeight: CGFloat = imageWidth
    let xDim: CGFloat = super.view.bounds.width / 2 - imageWidth / 2
    let yDim: CGFloat = super.view.bounds.height / 2 - imageHeight / 2
    
    playButtonOverlay.frame = CGRect(x: xDim, y: yDim, width: imageWidth, height: imageHeight)
    playButtonOverlay.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
    playButtonOverlay.contentHorizontalAlignment = .fill
    playButtonOverlay.contentVerticalAlignment = .fill
    playButtonOverlay.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    playButtonOverlay.tintColor = .white
    playButtonOverlay.addTarget(self, action: #selector(restartGameAfterPause), for: UIControl.Event.touchUpInside)
  }
  
  @objc fileprivate func restartGameAfterPause() {
    makeBackgroundVisible()
    timeManager.startTimer()
  }
  
  fileprivate func setUpBackgroundBlur() {
    guard UIAccessibility.isReduceTransparencyEnabled == false else {
      let opaqueBackground = UIView()
      opaqueBackground.backgroundColor = .darkGray
      opaqueBackground.translatesAutoresizingMaskIntoConstraints = false
      opaqueBackground.frame = view.bounds
      view.addSubview(opaqueBackground)
      view.addSubview(playButtonOverlay)
      return
    }
    
    let blurEffect = UIBlurEffect(style: .dark)
    blurView = UIVisualEffectView(effect: blurEffect)
    blurView.translatesAutoresizingMaskIntoConstraints = false
    blurView.frame = view.bounds
    view.addSubview(blurView)
    
    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
    vibrancyView.translatesAutoresizingMaskIntoConstraints = false
    vibrancyView.frame = view.bounds
    
    vibrancyView.contentView.addSubview(playButtonOverlay)
    blurView.contentView.addSubview(vibrancyView)
  }
  
  //MARK: - Functions
  private func setUpCollectionViews() {
    for collection in collections {
      collection?.delegate = self
      collection?.dragDelegate = self
      collection?.dropDelegate = self
      collection?.dataSource = self
      collection?.dragInteractionEnabled = true
      collection?.isUserInteractionEnabled = true
      collection?.delaysContentTouches = false
    }
    numbersCollectionView.layer.borderWidth = 1
    numbersCollectionView.layer.cornerRadius = 15
    numbersCollectionView.layer.backgroundColor = K.BrandColors.grey?.resolvedColor(with: .current).cgColor
  }
  
  fileprivate func recurringSetupForNumbers() {
    flowLayout.minimumInteritemSpacing = 8
    flowLayout.minimumLineSpacing = 10
    flowLayout.estimatedItemSize = KTCenterFlowLayout.automaticSize
    numbersCollectionView.collectionViewLayout = flowLayout
    numbersCollectionView.layer.backgroundColor = K.BrandColors.grey?.resolvedColor(with: .current).cgColor
    numbersCollectionView.reloadInputViews()
  }
  
  fileprivate func recurringSetupForOperations() {
    for index in 0...9 {
      let cell = self.operationsCollectionView.cellForItem(at: [0, index])
      cell?.layer.backgroundColor = K.BrandColors.grey?.resolvedColor(with: .current).cgColor
    }
    
//    DispatchQueue.main.async {
//      if let clearCell = self.operationsCollectionView.cellForItem(at: [0,10]) {
//        self.viewBackground.add(to: clearCell)
//      }
//      if let checkCell = self.operationsCollectionView.cellForItem(at: [0,11]) {
//        self.viewBackground.add(to: checkCell)
//      }
//      self.operationsCollectionView.reloadInputViews()
//    }
  }
  
  fileprivate func updatePauseButton() {
    if gameInProgress {
      pauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    } else {
      pauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
  }
  
  fileprivate func resetGame() {
    gameInProgress = true
    gameManager.numbersArray = ["?", "?", "?", "?"]
    resultLabel.text = ("Can you make 10?")
    timeManager.timer.invalidate()
    timeManager.gameDuration = 0
  }
  
  fileprivate func selectNewNumbers() {
    for index in 0..<4 {
      gameManager.numbersArray[index] = String(Int.random(in: 0 ... 9))
    }
    numbersCollectionView.reloadData()
  }
  
  fileprivate func blurBackground() {
    setUpPlayButtonOverlay()
    setUpBackgroundBlur()
  }
  
  fileprivate func makeBackgroundVisible() {
    blurView.removeFromSuperview()
  }
  
  fileprivate func updateResultLabel(for result: String) {
    resultLabel.text = "You made 10?? \(String(describing: result))"
  }
  
  fileprivate func requestCustomInput() {
    let customAlert = UIAlertController(title: "Sure!", message: "Just type your numbers in here:", preferredStyle: .alert)
    customAlert.addTextField { (textField) in
      textField.textAlignment = .center
      textField.defaultTextAttributes.updateValue(10, forKey: NSAttributedString.Key.kern)
      textField.attributedPlaceholder = NSAttributedString(string: "????", attributes: [NSAttributedString.Key.kern : 10])
      textField.keyboardType = .numberPad
    }
    
    let addNumbers = UIAlertAction(title: "Try this!", style: .default) { (action) in
      if let input = customAlert.textFields?.first?.text {
        let inputArray = Array(input)
        
        if inputArray.count == 4 &&
          inputArray[0].isNumber &&
          inputArray[1].isNumber &&
          inputArray[2].isNumber &&
          inputArray[3].isNumber {
          
          self.resetGame()
          for index in 0..<4 {
            self.gameManager.numbersArray[index] = String(inputArray[index])
          }
          self.numbersCollectionView.reloadData()
          self.timeManager.startTimer()
          
        } else {
          let failedAlert = UIAlertController(title: "Woops!", message: "Something is not right...", preferredStyle: .alert)
          let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.present(customAlert, animated: true, completion: nil)
          }
          failedAlert.addAction(okAction)
          self.present(failedAlert, animated: true, completion: nil)
        }
      }
    }
    
    let cancel = UIAlertAction(title: "No thanks", style: .cancel, handler: { (action) in
      self.timeManager.startTimer()
    })
    
    customAlert.addAction(addNumbers)
    customAlert.addAction(cancel)
    self.present(customAlert, animated: true, completion: nil)
  }
  
  fileprivate func switchMenu(for sender: UIButton) {
    switch menuDropped {
    case 0:
      dropMenu(for: sender, withDelay: 0)
      menuDropped = sender.tag
    case sender.tag:
      returnMenu()
      menuDropped = 0
    default:
      returnMenu()
      dropMenu(for: sender, withDelay: 0.3)
      menuDropped = sender.tag
    }
  }
  
  fileprivate func dropMenu(for sender: UIButton, withDelay delay: TimeInterval) {
    UIView.animate(withDuration: 0.5,
                   delay: delay,
                   usingSpringWithDamping: 0.5,
                   initialSpringVelocity: 0.5,
                   options: .curveEaseInOut,
                   animations: {
                    self.dropDownView.frame.origin.y += K.Drop.height
                    self.dropDownBottomConstraint.constant = -1 * K.Drop.height
                    self.dropDownView.layoutIfNeeded()
    }, completion: nil)
  }
  
  fileprivate func returnMenu() {
    UIView.animate(withDuration: 0.2,
                   delay: 0,
                   animations: {
                    self.dropDownView.frame.origin.y -= K.Drop.height
                    self.dropDownBottomConstraint.constant = 0
                    self.dropDownView.layoutIfNeeded()
    }, completion: nil)
  }
  
  fileprivate func showMenu(for tag: Int, in view: UIView) {
    if gameManager.gameMode == .classic {
      modeButton.setImage(UIImage(systemName: "10.circle"), for: .normal)
    } else {
      modeButton.setImage(UIImage(systemName: "clock"), for: .normal)
    }
  }
}
