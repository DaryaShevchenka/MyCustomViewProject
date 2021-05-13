//
//  MyCustomView.swift
//  MyCustomViewProject
//
//  Created by Darya Drobyshevsky on 5/11/21.
//

import UIKit

@IBDesignable class MyCustomView: UIView {

    
     @IBOutlet weak var labelForView: UILabel!
    
    @IBInspectable var labelText: String{
        get{  // get будет возвращать значение лейбла
            return labelForView.text!
        }
        set (labelText){ // Set будет ставить новое значение
            labelForView.text = labelText
        }
    }
    
    
    var workingView: UIView! //в качестве нашего кастомного вью
    var xibName: String = "MyCustomView"//xibName как имя xib-файла
    

     override init(frame: CGRect){
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
        
    }
    func getFromXib() ->UIView{
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    func setCustomView(){
        workingView = getFromXib()
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, . flexibleHeight]
        addSubview(workingView)
    }
   
}


