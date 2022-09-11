//
//  ViewController.swift
//  10-1 change mask colors
//
//  Created by Ryan Lin on 2022/9/10.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var waterImageView: UIImageView!
    
    @IBOutlet weak var hornsView: UIView!
    @IBOutlet weak var headView: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var redSwitchFunction: UISwitch!
    @IBOutlet weak var greenSwitchFunction: UISwitch!
    @IBOutlet weak var blueSwitchFunction: UISwitch!
    @IBOutlet weak var alphaSwitchFunction: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var randomFunction: UIButton!
    @IBOutlet weak var resetFunction: UIButton!
    
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var frameSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    
   
    //用變數來儲存角和頭兩物件的各項對應Slider的初始值（使用者透過Slider被調整過後，則會存入新的值）
    var hornsRedValue: Float = 0
    var hornsGreenValue: Float = 1
    var hornsBlueValue: Float = 1
    var hornsAlphaValue: Float = 1
    
    var headRedValue: Float = 1
    var headGreenValue: Float = 1
    var headBlueValue: Float = 1
    var headAlphaValue: Float = 1
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let image = UIImage(named: "horns")
        let hornsImageView = UIImageView(image: image)
        hornsImageView.frame = hornsView.bounds
        hornsImageView.contentMode = .scaleAspectFit
        hornsView.mask = hornsImageView
        //設定一開始畫面顯示角的顏色(與slider, button沒有連動)
        hornsView.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
        
        let headImageView = UIImageView(image: UIImage(named: "head"))
        headImageView.frame = headView.bounds
        headImageView.contentMode = .scaleAspectFit
        headView.mask = headImageView
        //設定一開始畫面顯示頭的顏色
        headView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    }
    
    //讓 Label 顯示對應的 Slider value
    func colorValueLabel() {
        redValueLabel.text = String(Int(redSlider.value*255))
        greenValueLabel.text = String(Int(greenSlider.value*255))
        //整數也可以這樣寫
        blueValueLabel.text = String(format:"%.0f", blueSlider.value*255)
        alphaValueLabel.text = String(format: "%.1f", alphaSlider.value)
    }
    // 每次移動 Slider 後將對應的value儲存至原本變數中
    func hornsColorValueSave(){
        hornsRedValue = redSlider.value
        hornsGreenValue = greenSlider.value
        hornsBlueValue = blueSlider.value
        hornsAlphaValue = alphaSlider.value
        
    }
    func headColorValueSave(){
        headRedValue = redSlider.value
        headGreenValue = greenSlider.value
        headBlueValue = blueSlider.value
        headAlphaValue = alphaSlider.value
        
    }
    
    //用已儲存進變數的Value（新的顏色數值）讓Slider跳至相對應的位置
    func hornsColorSliderSet(){
        redSlider.setValue(hornsRedValue, animated: true)
        greenSlider.setValue(hornsGreenValue, animated: true)
        blueSlider.setValue(hornsBlueValue, animated: true)
        alphaSlider.setValue(hornsAlphaValue, animated: true)
    }
    
    func headColorSliderSet(){
        redSlider.setValue(headRedValue, animated: true)
        greenSlider.setValue(headGreenValue, animated: true)
        blueSlider.setValue(headBlueValue, animated: true)
        alphaSlider.setValue(headAlphaValue, animated: true)
    }
   
    //設定不同 Index 的 Segmented Control對應各自的 View
    @IBAction func segmentValueSwitch(_ sender: Any) {
        
        if segmentedControl.selectedSegmentIndex == 0{
            hornsView.backgroundColor = UIColor(red: CGFloat(hornsRedValue), green: CGFloat(hornsGreenValue), blue: CGFloat(hornsBlueValue), alpha: CGFloat(hornsAlphaValue))
            
            hornsColorSliderSet()
        }
        else if segmentedControl.selectedSegmentIndex == 1{
            headView.backgroundColor = UIColor(red: CGFloat(headRedValue), green: CGFloat(headGreenValue), blue: CGFloat(headBlueValue), alpha: CGFloat(headAlphaValue))
            
            headColorSliderSet()
        }
        colorValueLabel()
    }
    
    // slider 的變動
    @IBAction func sliderValueChange(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0{
            hornsView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            
            hornsColorValueSave()
        }
        else if segmentedControl.selectedSegmentIndex == 1{
            headView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            
            headColorValueSave()
        }
        colorValueLabel()
    }
    //隨機顏色按鈕
    @IBAction func randomButton(_ sender: Any) {
        redSlider.setValue(.random(in: 0...1), animated: true)
        greenSlider.setValue(.random(in: 0...1), animated: true)
        blueSlider.setValue(.random(in: 0...1), animated: true)
        alphaSlider.setValue(.random(in: 0...1), animated: true)
        
        if segmentedControl.selectedSegmentIndex == 0{
            
            hornsView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            
            hornsColorValueSave()
        }
        else if segmentedControl.selectedSegmentIndex == 1{
            headView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            
            headColorValueSave()
        }
        colorValueLabel()
    }
    //重新設定按鈕
    @IBAction func resetButton(_ sender: UIButton) {
        
        if segmentedControl.selectedSegmentIndex == 0{
            
           hornsRedValue = 0
           hornsGreenValue = 1
           hornsBlueValue = 1
           hornsAlphaValue = 1
            
           hornsColorSliderSet()
            
           hornsView.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
            
            hornsColorValueSave()
        }
        else if segmentedControl.selectedSegmentIndex == 1{
            
           headRedValue = 1
           headGreenValue = 1
           headBlueValue = 1
           headAlphaValue = 1
            
           headColorSliderSet()
            
           headView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            
           headColorValueSave()
        }
           colorValueLabel()
    }
    //switch開關
    @IBAction func colorsSwitch(_ sender: UISwitch) {
       
        //四個 Switch 要全是on，才能用 Random 及 Reset
        if redSwitchFunction.isOn == true && greenSwitchFunction.isOn == true && blueSwitchFunction.isOn == true && alphaSwitchFunction.isOn == true{
                   
                   randomFunction.isEnabled = true
                   resetFunction.isEnabled = true
               }
        if segmentedControl.selectedSegmentIndex == 0{
            
            //設定紅色的 Switch
            if redSwitchFunction.isOn == true{
                
                redSlider.isEnabled = true
                
            }
            //關掉顏色開關，數值變為0
            if redSwitchFunction.isOn == false{
                
                //讓角及頭的Slider數值變成0
                hornsRedValue = 0
                headRedValue = 0
                
                //讓紅色Slider儲存新的變數值（新的顏色數值）
                redSlider.setValue(0, animated: true)
               
                //讓角的影像紅色數值變0
                hornsView.backgroundColor = UIColor(red: 0, green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
         
                // 每次移動 Slider 後將對應的value儲存至原本變數中
                hornsColorValueSave()
                
                //讓 Label 顯示對應的 Slider 數值
                colorValueLabel()
            
                //讓 Slider 不能滑動
                redSlider.isEnabled = false
                
                //停用 Random 及 Reset 功能
                randomFunction.isEnabled = false
                resetFunction.isEnabled = false
            }
        
            //設定綠色的 Switch
            if greenSwitchFunction.isOn == true{
                
                greenSlider.isEnabled = true
               
            }
            if greenSwitchFunction.isOn == false{
                
                hornsGreenValue = 0
                headGreenValue = 0
            
                greenSlider.setValue(0, animated: true)
               
            
                hornsView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: 0, blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))

                hornsColorValueSave()
                    
                colorValueLabel()
            
                greenSlider.isEnabled = false
                
                randomFunction.isEnabled = false
                resetFunction.isEnabled = false
            }
            
            //設定藍色的 Switch
            if blueSwitchFunction.isOn == true{
                
                blueSlider.isEnabled = true
                
            }
            if blueSwitchFunction.isOn == false{
                
                hornsBlueValue = 0
                headBlueValue = 0
            
                blueSlider.setValue(0, animated: true)
               
            
                hornsView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: 0, alpha: CGFloat(alphaSlider.value))
     
                hornsColorValueSave()
            
                colorValueLabel()
            
                blueSlider.isEnabled = false
                
                randomFunction.isEnabled = false
                resetFunction.isEnabled = false
            }
            
            //設定透明度的 Switch
            if alphaSwitchFunction.isOn == true{
                
                alphaSlider.isEnabled = true
                
            }
            if alphaSwitchFunction.isOn == false{
                
                hornsAlphaValue = 1
                headAlphaValue = 1
            
                alphaSlider.setValue(1, animated: true)
            
                hornsView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
     
                hornsColorValueSave()

                colorValueLabel()
            
                alphaSlider.isEnabled = false
                
                randomFunction.isEnabled = false
                resetFunction.isEnabled = false
            }
        }
       
        if segmentedControl.selectedSegmentIndex == 1{
            
            
            //設定紅色的 Switch
            if redSwitchFunction.isOn == true{
                
                redSlider.isEnabled = true
                
            }
            //關掉顏色開關，數值變為0
            if redSwitchFunction.isOn == false{
                
                //讓角及頭的Slider數值變成0
                headRedValue = 0
                hornsRedValue = 0
                
                //讓紅色Slider儲存新的變數值（新的顏色數值）
                redSlider.setValue(0, animated: true)
                
                //讓頭的影像紅色數值變0
                headView.backgroundColor = UIColor(red: 0, green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
                    
                //每次移動 Slider 後將對應的value儲存至原本變數中
                headColorValueSave()
                
                //讓 Label 顯示對應的 Slider 數值
                colorValueLabel()
                
                //讓 Slider 不能滑動
                redSlider.isEnabled = false
                
                //停用 Random 及 Reset 功能
                randomFunction.isEnabled = false
                resetFunction.isEnabled = false
            }
        
            //設定綠色的 Switch
            if greenSwitchFunction.isOn == true{
                
                greenSlider.isEnabled = true
               
            }
            if greenSwitchFunction.isOn == false{
                
                hornsGreenValue = 0
                headGreenValue = 0
            
                greenSlider.setValue(0, animated: true)
               
                headView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: 0, blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
                
                headColorValueSave()
            
                colorValueLabel()
            
                greenSlider.isEnabled = false
                
                randomFunction.isEnabled = false
                resetFunction.isEnabled = false
            }
            
            //設定藍色的 Switch
            if blueSwitchFunction.isOn == true{
                
                blueSlider.isEnabled = true
                
            }
            if blueSwitchFunction.isOn == false{
                
                hornsBlueValue = 0
                headBlueValue = 0
            
                blueSlider.setValue(0, animated: true)
     
                headView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: 0, alpha: CGFloat(alphaSlider.value))
                
                headColorValueSave()
            
                colorValueLabel()
            
                blueSlider.isEnabled = false
                
                randomFunction.isEnabled = false
                resetFunction.isEnabled = false
            }
            
            //設定透明度的 Switch
            if alphaSwitchFunction.isOn == true{
                
                alphaSlider.isEnabled = true
                
            }
            if alphaSwitchFunction.isOn == false{
                
                hornsAlphaValue = 1
                headAlphaValue = 1
            
                alphaSlider.setValue(1, animated: true)
               
                headView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
                
                headColorValueSave()
            
                colorValueLabel()
            
                alphaSlider.isEnabled = false
                
                randomFunction.isEnabled = false
                resetFunction.isEnabled = false
            }
        }
    }
    @IBAction func radiusSliderChange(_ sender: Any) {
        //waterImageView設圓角，後面shadowＶiew會露出來，所以要一起設圓角
        waterImageView.layer.cornerRadius = CGFloat(radiusSlider.value)
        shadowView.layer.cornerRadius = CGFloat(radiusSlider.value)
        //角會超出圓角，所以也一併設定
        hornsView.layer.cornerRadius = CGFloat(radiusSlider.value)
    }
    
    @IBAction func frameSliderChange(_ sender: Any) {
        waterImageView.clipsToBounds = true
        waterImageView.layer.borderWidth = CGFloat(frameSlider.value)
        waterImageView.layer.borderColor = CGColor(red: 1, green: (222/255), blue: (173/255), alpha: 0.5)
    }
    
    @IBAction func shadowSliderChange(_ sender: Any) {
        shadowView.layer.shadowOpacity = Float(0.5)
        shadowView.layer.shadowRadius = CGFloat(shadowSlider.value)
    }
    
    @IBAction func radiusSwitch(_ sender: UISwitch) {
        
        if sender.isOn == true{
            radiusSlider.isHidden = false
            waterImageView.layer.cornerRadius = CGFloat(radiusSlider.value)
            shadowView.layer.cornerRadius = CGFloat(radiusSlider.value)
        }
        else{
            radiusSlider.isHidden = true
            waterImageView.layer.cornerRadius = CGFloat(0)
            shadowView.layer.cornerRadius = CGFloat(0)
        }
        }
        
    @IBAction func frameSwitch(_ sender: UISwitch) {
        if sender.isOn == true{
            frameSlider.isHidden = false
            waterImageView.layer.borderWidth = CGFloat(frameSlider.value)
        }
        else{
            frameSlider.isHidden = true
            waterImageView.layer.borderWidth = CGFloat(0)
        }
    }

    @IBAction func shadowSwitch(_ sender: UISwitch) {
        if sender.isOn == true{
            
            shadowSlider.isHidden = false
            shadowView.layer.shadowRadius = CGFloat(shadowSlider.value)
        }
        else{
            shadowSlider.isHidden = true
            shadowView.layer.shadowRadius = CGFloat(0)
        }
        
    }
    
        
        
    }


