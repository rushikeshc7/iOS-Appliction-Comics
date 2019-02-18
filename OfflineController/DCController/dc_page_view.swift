//
//  dc_page_view.swift
//  Comics
//
//  Created by Mac on 23/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class dc_page_view: UIViewController, UIScrollViewDelegate {
    
    var dict_items_dcPageVC = [String:Any]()
    
    @IBOutlet weak var scrollView_dc: UIScrollView!
    @IBOutlet weak var pageControl_dc: UIPageControl!
    var slides_dc : [slide_dc] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView_dc.delegate = self
        slides_dc = createSlides_1()
        setupSlideScrollView(slides_dc: slides_dc)
        
        pageControl_dc.numberOfPages = slides_dc.count
        pageControl_dc.currentPage = 0
        view.bringSubview(toFront: pageControl_dc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func createSlides_1() -> [slide_dc] {
        
        let slide1:slide_dc = Bundle.main.loadNibNamed("slide_view_dc", owner: self, options: nil)?.first as! slide_dc
        slide1.img_slide_dc.image = UIImage(named: dict_items_dcPageVC["img_1"] as! String)!
        
        let slide2:slide_dc = Bundle.main.loadNibNamed("slide_view_dc", owner: self, options: nil)?.first as! slide_dc
        slide2.img_slide_dc.image = UIImage(named: dict_items_dcPageVC["img_2"] as! String)!
        
        let slide3:slide_dc = Bundle.main.loadNibNamed("slide_view_dc", owner: self, options: nil)?.first as! slide_dc
        slide3.img_slide_dc.image = UIImage(named: dict_items_dcPageVC["img_3"] as! String)!
        
        let slide4:slide_dc = Bundle.main.loadNibNamed("slide_view_dc", owner: self, options: nil)?.first as! slide_dc
        slide4.img_slide_dc.image = UIImage(named: dict_items_dcPageVC["img_4"] as! String)!
        
        let slide5:slide_dc = Bundle.main.loadNibNamed("slide_view_dc", owner: self, options: nil)?.first as! slide_dc
        slide5.img_slide_dc.image = UIImage(named: dict_items_dcPageVC["img_5"] as! String)!
        
        let slide6:slide_dc = Bundle.main.loadNibNamed("slide_view_dc", owner: self, options: nil)?.first as! slide_dc
        slide6.img_slide_dc.image = UIImage(named: dict_items_dcPageVC["img_6"] as! String)!
        
        let slide7:slide_dc = Bundle.main.loadNibNamed("slide_view_dc", owner: self, options: nil)?.first as! slide_dc
        slide7.img_slide_dc.image = UIImage(named: dict_items_dcPageVC["img_7"] as! String)!
        
        return [slide1, slide2, slide3, slide4, slide5, slide6, slide7]
    }

    func setupSlideScrollView(slides_dc : [slide_dc]) {
        scrollView_dc.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView_dc.contentSize = CGSize(width: view.frame.width * CGFloat(slides_dc.count), height: view.frame.height)
        scrollView_dc.isPagingEnabled = true
        
        for i in 0 ..< slides_dc.count {
            slides_dc[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView_dc.addSubview(slides_dc[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl_dc.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView_dc.contentSize.width - scrollView_dc.frame.width
        let currentHorizontalOffset: CGFloat = scrollView_dc.contentOffset.x
    
    }
    
}
