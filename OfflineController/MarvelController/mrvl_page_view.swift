//
//  mrvl_page_view.swift
//  Comics
//
//  Created by Mac on 23/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class mrvl_page_view: UIViewController, UIScrollViewDelegate {
    
    var dict_items_mrvlPageVC = [String:Any]()
    
    @IBOutlet weak var scrollView_marvel: UIScrollView!
    @IBOutlet weak var pageControl_marvel: UIPageControl!
    var slides_marvel : [slide_mrvl] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView_marvel.delegate = self
        slides_marvel = createSlides()
        setupSlideScrollView(slides_marvel: slides_marvel)
        
        pageControl_marvel.numberOfPages = slides_marvel.count
        pageControl_marvel.currentPage = 0
        view.bringSubview(toFront: pageControl_marvel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func createSlides() -> [slide_mrvl] {
        
        let slide1:slide_mrvl = Bundle.main.loadNibNamed("slide_view_mrvl", owner: self, options: nil)?.first as! slide_mrvl
        slide1.img_slide_mrvl.image = UIImage(named: dict_items_mrvlPageVC["img_1"] as! String)!
    
        let slide2:slide_mrvl = Bundle.main.loadNibNamed("slide_view_mrvl", owner: self, options: nil)?.first as! slide_mrvl
        slide2.img_slide_mrvl.image = UIImage(named: dict_items_mrvlPageVC["img_2"] as! String)!
        
        let slide3:slide_mrvl = Bundle.main.loadNibNamed("slide_view_mrvl", owner: self, options: nil)?.first as! slide_mrvl
        slide3.img_slide_mrvl.image = UIImage(named: dict_items_mrvlPageVC["img_3"] as! String)!
    
        let slide4:slide_mrvl = Bundle.main.loadNibNamed("slide_view_mrvl", owner: self, options: nil)?.first as! slide_mrvl
        slide4.img_slide_mrvl.image = UIImage(named: dict_items_mrvlPageVC["img_4"] as! String)!
    
        let slide5:slide_mrvl = Bundle.main.loadNibNamed("slide_view_mrvl", owner: self, options: nil)?.first as! slide_mrvl
        slide5.img_slide_mrvl.image = UIImage(named: dict_items_mrvlPageVC["img_5"] as! String)!
        
        let slide6:slide_mrvl = Bundle.main.loadNibNamed("slide_view_mrvl", owner: self, options: nil)?.first as! slide_mrvl
        slide6.img_slide_mrvl.image = UIImage(named: dict_items_mrvlPageVC["img_6"] as! String)!
    
        let slide7:slide_mrvl = Bundle.main.loadNibNamed("slide_view_mrvl", owner: self, options: nil)?.first as! slide_mrvl
        slide7.img_slide_mrvl.image = UIImage(named: dict_items_mrvlPageVC["img_7"] as! String)!
        
        return [slide1, slide2, slide3, slide4, slide5, slide6, slide7]
    }
    
    
    func setupSlideScrollView(slides_marvel : [slide_mrvl]) {
        scrollView_marvel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView_marvel.contentSize = CGSize(width: view.frame.width * CGFloat(slides_marvel.count), height: view.frame.height)
        scrollView_marvel.isPagingEnabled = true
        
        for i in 0 ..< slides_marvel.count {
            slides_marvel[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView_marvel.addSubview(slides_marvel[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView_marvel.contentOffset.x/view.frame.width)
        pageControl_marvel.currentPage = Int(pageIndex)

        let maximumHorizontalOffset: CGFloat = scrollView_marvel.contentSize.width - scrollView_marvel.frame.width
        let currentHorizontalOffset: CGFloat = scrollView_marvel.contentOffset.x
    }
  
}
