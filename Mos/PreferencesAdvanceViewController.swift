//
//  PreferencesAdvanceViewController.swift
//  Mos
//
//  Created by Cb on 2017/1/26.
//  Copyright © 2017年 Cb. All rights reserved.
//

import Cocoa

class PreferencesAdvanceViewController: NSViewController {
    
    @IBOutlet weak var scrollSpeedSlider: NSSlider!
    @IBOutlet weak var scrollSpeedLabel: NSTextField!
    @IBOutlet weak var scrollSpeedStepper: NSStepper!
    @IBOutlet weak var scrollTimeSlider: NSSlider!
    @IBOutlet weak var scrollTimeLabel: NSTextField!
    @IBOutlet weak var scrollTimeStepper: NSStepper!
    @IBOutlet weak var scrollPeakSlider: NSSlider!
    @IBOutlet weak var scrollPeakLabel: NSTextField!
    @IBOutlet weak var scrollPeakStepper: NSStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 恢复一下设置
        // 速度
        scrollSpeedSlider.doubleValue = ScrollCore.advancedOption.speed
        scrollSpeedLabel.stringValue = String(format: "%.2f", ScrollCore.advancedOption.speed)
        scrollSpeedStepper.doubleValue = ScrollCore.advancedOption.speed
        // 时间
        scrollTimeSlider.intValue = Int32(ScrollCore.advancedOption.time)
        scrollTimeLabel.stringValue = String(ScrollCore.advancedOption.time)
        scrollTimeStepper.intValue = Int32(ScrollCore.advancedOption.time)
        // 峰值
        scrollPeakSlider.doubleValue = ScrollCore.advancedOption.peak
        scrollPeakLabel.stringValue = String(format: "%.2f", ScrollCore.advancedOption.peak)
        scrollPeakStepper.doubleValue = ScrollCore.advancedOption.peak
    }
    
    // 速度设置
    @IBAction func scrollSpeedSliderChange(_ sender: NSSlider) {
        // 修改Stepper
        scrollSpeedStepper.doubleValue = sender.doubleValue
        // 更新值
        setScrollSpeed(value: sender.doubleValue)
    }
    @IBAction func scrollSpeedStepperChange(_ sender: NSStepper) {
        // 修改Slider
        scrollSpeedSlider.doubleValue = sender.doubleValue
        // 更新值
        setScrollSpeed(value: sender.doubleValue)
    }
    func setScrollSpeed(value: Double) {
        // 修改文字
        scrollSpeedLabel.stringValue = String(format: "%.2f", value)
        // 修改实际参数
        ScrollCore.advancedOption.speed = value
        // 重新初始化曲线
        ScrollCore.basePluseData = ScrollCore.initPluseData()
        // 保存设置
        UserDefaults.standard.set(ScrollCore.advancedOption.speed, forKey:"speed")
    }
    
    // 时间设置
    @IBAction func scrollTimeSliderChange(_ sender: NSSlider) {
        // 修改Stepper
        scrollTimeStepper.intValue = sender.intValue
        // 更新值
        setScrollTime(value: sender.intValue)
    }
    @IBAction func scrollTimeStepperChange(_ sender: NSStepper) {
        // 修改Slider
        scrollTimeSlider.intValue = sender.intValue
        // 更新值
        setScrollTime(value: sender.intValue)
    }
    func setScrollTime(value: Int32) {
        // 修改文字
        scrollTimeLabel.stringValue = String(value)
        // 修改实际参数
        ScrollCore.advancedOption.time = Int(value)
        // 重新初始化曲线
        ScrollCore.totalPoint = Int(ScrollCore.fps * Double(ScrollCore.advancedOption.time) / 1000.0)
        ScrollCore.basePluseData = ScrollCore.initPluseData()
        ScrollCore.turningPoint = Int(round(Double(ScrollCore.totalPoint)*ScrollCore.turningScale))
        // 保存设置
        UserDefaults.standard.set(ScrollCore.advancedOption.time, forKey:"time")
    }
    
    // 峰值设置
    @IBAction func scrollPeakSliderChange(_ sender: NSSlider) {
        // 修改Stepper
        scrollPeakStepper.doubleValue = sender.doubleValue
        // 更新值
        setScrollPeak(value: sender.doubleValue)
    }
    @IBAction func scrollPeakStepperChange(_ sender: NSStepper) {
        // 修改Slider
        scrollPeakSlider.doubleValue = sender.doubleValue
        // 更新值
        setScrollPeak(value: sender.doubleValue)
    }
    func setScrollPeak(value: Double) {
        // 修改文字
        scrollPeakLabel.stringValue = String(format: "%.2f", value)
        // 修改实际参数
        ScrollCore.advancedOption.peak = value
        // 重新初始化曲线
        ScrollCore.basePluseData = ScrollCore.initPluseData()
        // 保存设置
        UserDefaults.standard.set(ScrollCore.advancedOption.peak, forKey:"peak")
    }
    
    
    // 重置
    @IBAction func resetAllToDefaultClick(_ sender: NSButton) {
        // 重置速度
        let defSpeed = ScrollCore.defAdvancedOption.speed
        scrollSpeedSlider.doubleValue = defSpeed
        scrollSpeedStepper.doubleValue = defSpeed
        scrollSpeedLabel.stringValue = String(format: "%.2f", defSpeed)
        setScrollSpeed(value: defSpeed)
        // 重置时间
        let defTime = Int32(ScrollCore.defAdvancedOption.time)
        scrollTimeStepper.intValue = defTime
        scrollTimeSlider.intValue = defTime
        scrollTimeLabel.stringValue = String(format: "%.2i", defTime)
        setScrollTime(value: defTime)
        // 重置峰值
        let defPeak = ScrollCore.defAdvancedOption.peak
        scrollPeakSlider.doubleValue = defPeak
        scrollPeakStepper.doubleValue = defPeak
        scrollPeakLabel.stringValue = String(format: "%.2f", defPeak)
        setScrollPeak(value: defPeak)
    }
}
