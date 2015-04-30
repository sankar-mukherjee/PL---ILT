var _userAgent = navigator.userAgent.toLowerCase();
var _version = (_userAgent.match( /.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/ ) || [])[1];
var _safari = /webkit/.test( _userAgent );
var _opera = /opera/.test(_userAgent);
var _msie = /msie/.test( _userAgent ) && !/opera/.test( _userAgent );
var _mozilla = /mozilla/.test( _userAgent ) && !/(compatible|webkit)/.test( _userAgent );

function getVersion(){
	return _version;
}

function getUserAgent(){
	return _userAgent;
}
function isSafari(){
	return _safari;
}

function isOpera(){
	return _opera;
}

function isIE()	{
	return _msie;
}

function isMozilla(){
	return _mozilla;
}

var _fnkey = false;
function dostopevent(event) {
	try	{
		event.stopPropagation();
	}catch(e){}
	try	{
		event.preventDefault();
	}catch(e){}
	try {
		window.event.keyCode = 0;
	}catch(e)   {}
	try {
		window.event.returnValue = false;
	}catch(e){}

}
function dokeydown(obj,event){
	_event = (window.event) ? window.event : event;
	var key = isPressKeyCode(_event);
	var shift = _event.shiftKey;
	var ctrl = _event.ctrlKey;
	if(_event.metaKey)
		_ctrl = _event.metaKey;
	if(ctrl)	{
		dostopevent(_event);
	}else	{
		_fnkey = false;
		if(!isOpera())  {
			if(_fnkey)    {
				dostopevent(_event);
				return false;
			}
		}
	}
	return true;
}
function dokeypress(obj,event){
	event = (window.event) ? window.event : event;
	if(isOpera() || isSafari()) {
		if(_fnkey)    {
			dostopevent(event);
			_fnkey = false;
			return false;
		}
	}else{
		if(_fnkey)    {
			dostopevent(event);
			_fnkey = false;
			return false;
		}
	}
	return true;
}
function dovalidate(obj,event){
	PERFORM_VALIDATION(obj.id);
}
function docontextmenu(obj,event)	{
	return false;
}
function doclick(obj,event)	{
	event = (window.event) ? window.event : event;
		if (event.button == 2) {
			return false;
		}
	
	if (document.all) {
		if (event.button == 2) {
			return false;
		}
	}
	if (document.layers) {
		if (e.which == 3) {
			return false;
		}
	}	
}
function setError(id,msg){
	document.getElementById(id).innerHTML = "<span style='color:red'>" + msg + "</span>"; 
	
}

function clearError(id)	{
	document.getElementById(id).innerHTML = "";	
}
	var KEY_ENTER = 13;
	var KEY_F2 = 113;
	var KEY_ESC = 27;
	var KEY_TAB = 9;
	var KEY_F5 = 116;
	var KEY_F1 = 112;
	var KEY_F3 = 114;
	var KEY_F12=123;
	var KEY_F11 = 122;
	var KEY_F10 = 121;
	var KEY_LEFTARROW = 37;
	var KEY_RIGHTARROW = 39;
	var KEY_UPPERCASE_A = 65;
	var KEY_UPPERCASE_Z = 90;
	var KEY_LOWERCASE_A = 97;
	var KEY_LOWERCASE_Z = 122;
	var KEY_SPACE = 32;
	var KEY_NUMBER_0 = 48;
	var KEY_NUMBER_9 = 57;
	var KEY_COMMA = 188;
	var KEY_F9	= 9;
	var KEY_HYPHEN = 45;
	var KEY_FWDSLASH = 47;
	var KEY_DOT = 46;
	var KEY_BACKSPACE = 8;
	var KEY_DELETE = 46; 	
		

	var calendar;     //---  Reference  For dhtmlxCalendar() 
	var valueObject;  //---  Reference  For Input Obj
	var divObject;    //---  Reference  For Div Obj 
	
	
	var convSubUnit='1000';
	var convSubUnit=getSubUnits(convSubUnit);	
	var amtFormatType='L';//E.Vairalakshmi-22012008-chn


	/** 
		Fetch the Date Value from dhtml and set it to Input Type
	*/	
	function selectDate(date) {
			
		valueObject.value = calendar.getFormatedDate(null,date);
		divObject.style.display = 'none';
		if(!valueObject.readOnly) valueObject.focus();
	}

	/** Key Press Code */
	function isPressKeyCode(evt){
		evt = (evt) ? evt : (window.event) ? event : null;
		  if (evt){
			    var charCode = (evt.charCode) ? evt.charCode :((evt.keyCode) ? evt.keyCode :((evt.which) ? evt.which : 0));
			    return charCode;
  		  }
  		  return 0;
	}
	
	// Changes made by Vairalakshmi - 26-10-2007 - End
	function getSubUnits(SubUnitsAmount){
		SubUnitsAmount=parseInt(""+SubUnitsAmount.length)-1;
		return SubUnitsAmount;
	}
	
	function formatNumbercurr(num1,decLen) {
		var x;
		var k;
		var indexCounter = 0;
		j=0;
		//pugazh.a-chn-27-02-2007-beg
		num1 = unFormat(num1);
		//pugazh.a-chn-27-02-2007-end 
		/*E.Vairalakshmi-22012008-chn-start
		if(amtFormatType.toUpperCase()=="L"){
			return lakhFormat(num1);
		}else{
		*///E.Vairalakshmi-22012008-chn-enf	
			newnumString = "";
			dotPos = num1.indexOf(".");
			
			if(dotPos >=0) {
				intPart = num1.substring(0,dotPos);
				decPart = num1.substring(dotPos+1,num1.length);
				
				k=eval(decLen-decPart.length);
				
				if(k<decLen || decPart==""){
					for(i=1;i<=k;i++){
							decPart=decPart+"0";
						}
						decPart = "."+decPart;
					} else {
					decPart = "."+decPart;
				}
				StringLen = intPart.length;
				
			} else {
				intPart = num1.substring(0,num1.length);
				decPart="";
				if(decLen>0)
				{
					for(i=1;i<=decLen;i++){
					decPart = decPart+"0";
					}
					decPart="."+decPart;
				}
				StringLen = intPart.length;
			}
			
			for(x=StringLen-1; x>=0; x--) {
				indexCounter++;
				if(indexCounter == 4) {
					if(num1.charAt(x) != "-")
					{
						numreplace=num1.charAt(x)+",";
						newnumString = numreplace+newnumString;
						indexCounter = 1;
					}
					else
					{
						newnumString = num1.charAt(x)+newnumString;
					}
				} else {
					newnumString = num1.charAt(x)+newnumString;
				}
			}
			if(dotPos==0)
			{
				newnumString = "0" + newnumString;
			}
			if(newnumString.charAt(0)=="") {
			}
			if(newnumString.charAt(0)=="," || (newnumString.charAt(0)=="0" && dotPos >1) ) {
				newnumString=newnumString.substring(1,newnumString.length)+decPart;
				num1 = newnumString;
				return trimNumber(newnumString,decLen);
			} else {
				newnumString=newnumString+decPart;
				num1 = newnumString;
				return trimNumber(newnumString,decLen);
			}	
		//}	//end of else //E.Vairalakshmi-22012008-chn
	}
	
	function trimNumber(inputNum,decLen) {
		var totLen;
		decLen=parseInt(decLen);
		dotPos = inputNum.indexOf(".");
		totLen = eval(dotPos+decLen+1);
		if(inputNum.indexOf(".") >=0) {
			intPart = inputNum.substring(0,dotPos);
			decPart = inputNum.substring(dotPos+1,inputNum.length);
			decPart = "."+decPart;
			StringLen = intPart.length;
		} else {
			intPart = inputNum.substring(0,inputNum.length);
			decPart = "";
			StringLen = intPart.length;
		}
		if(decPart.length > decLen) {
			decPart = inputNum.substring(dotPos+1,totLen);
			decPart = "."+decPart;
		}
		inputNum = intPart+decPart;
		return inputNum;
	}	
	
	
	function unFormat(num){
		newUnFormatStr="";
		for(i=0;i<num.length;i++) {
			if(num.charAt(i)!= ",") {
				newUnFormatStr=newUnFormatStr+num.charAt(i);
			}
			
		}
		var numLen;
		num = newUnFormatStr;
		numLen = num.length;	
		for(i=0;i<numLen;i++) {
			if(num.charAt(0)== "0" && num.indexOf(".") >1) {
				num=num.substring(1,num.length);
			}
		}	
		return num;	
	}
	
	/*function to handle triming of data*/
	function trim(val){
		var resultStr = trimLeft(val);
		resultStr = trimRight(resultStr);
		return resultStr;
	} // end Trim


	/* function to handle left Trimming of Data*/ 
	function trimLeft( str ) {
		var resultStr = "";
		var i = len = 0;
		
		// Return immediately if an invalid value was passed in
		if (str+"" == "undefined" || str == null)	
			return null;
	
		// Make sure the argument is a string
		str += "";
		if (str.length == 0) 
			resultStr = "";
		else {	
	 		// Loop through string starting at the beginning as long as there
	  		// are spaces.
			//	  	len = str.length - 1;
			len = str.length;
	  		while ((i <= len) && (str.charAt(i) == " "))
				i++;
		
		   	// When the loop is done, we're sitting at the first non-space char,
	 		// so return that char plus the remaining chars of the string.
	  		resultStr = str.substring(i, len);
	  	}				
	  	return resultStr;
	}// end TrimLeft
			
	/* function to handle right trimming of Data*/
	function trimRight( str ) {
		var resultStr = "";
		var i = 0;
		
		// Return immediately if an invalid value was passed in
		if (str+"" == "undefined" || str == null)	
			return null;
	
		// Make sure the argument is a string
		str += "";
			
		if (str.length == 0) 
			resultStr = "";
		else {
	  		// Loop through string starting at the end as long as there
	 		// are spaces.
	  		i = str.length - 1;
	  		while ((i >= 0) && (str.charAt(i) == " "))
	 			i--;
				 			
	 			// When the loop is done, we're sitting at the last non-space char,
		 		// so return that char plus all previous chars of the string.
		  		resultStr = str.substring(0, i + 1);
		  	}
		  	
		  	return resultStr;  	
	} 

	
	Object.prototype.isNumeric =  function() { 
	 var sText = this;
	 if (isNaN(sText)==false){
	 	return true;
	 }else{
	 	return false;
	 }	
    }

	
	function replaceall(str,findStr,replaceStr){
		var returnString =""; 
		var strArray     =str.split(findStr);
		for (var arrIndex=0 ; arrIndex < strArray.length -1 ; arrIndex++ ){
			returnString = returnString+strArray[arrIndex]+ replaceStr;
		}//end of for
		returnString = returnString + strArray[strArray.length -1];
		return returnString;
	}//end of replace all
	
	/*function to check whether the keyCode value is for Numeric or not*/
	function isNumeric(keycode,decFlag){ 
		if((keycode >= KEY_NUMBER_0 && keycode <=KEY_NUMBER_9) || (keycode==KEY_BACKSPACE)|| (keycode==KEY_TAB))
			return true;	
		else{
			if(decFlag == "Y"){
				if ((keycode>=KEY_NUMBER_0 && keycode<=KEY_NUMBER_9) || (keycode == KEY_DOT) || (keycode==KEY_BACKSPACE)|| (keycode==KEY_TAB)){
					if(isDotPressed(keycode))
						return true;
					else
						return false;
				}
			}else{
				if(keycode == KEY_TAB)
					return true;
				else{
					window.event.keyCode = 0;
					return false;	
				}
			}		
		}		
	}//end isNumeric()
	
	/* function to check whether Dot is Pressed or Not*/
	function isDotPressed(keycode,strVal){
		if(keycode == KEY_DOT){
			return true;		
		}else{
			window.event.keyCode = 0;
			return false;
		}			
	}//end isDotPressed()
	
	/*function to check whether the keyCode value is for Alphabets or not*/
	function isAlpha(ch){
	    if(ch >= KEY_UPPERCASE_A && ch <=KEY_UPPERCASE_Z || ch>=KEY_LOWERCASE_A && ch<=KEY_LOWERCASE_Z)
	        return true;
	    else
	        return false;
	}//end isAlpha()

/*function to check whether the keyCode value is for Spaces or not*/
	function isSpace(ch){
	    if(ch == KEY_SPACE)
	        return true;
	    else
	        return false;
	}//end isSpace()
	
	//Saikiran.D-27/05/2009-chn   END
	
function isBlank(val)	{
	if(val == undefined || val == null || trim(val) == "")	{
		return true;
	}
	return false;
}

function spacecheck(value) {  
  	str=new String(value);
  	var m="";
  	m=str.match(/[^0-9a-zA-Z\s]/g);
  	return m;
}	



// Functions for Help - start
	var eventObj;
	var w_gridobj;
	
     function hideHelp() {
		document.getElementById("helpframe").style.visibility="hidden";
	}
	

function isSecondOpenParen(textValue){
    var j=0;
    for (i = 0;  i < textValue.length;  i++){
		ch = textValue.charAt(i);
		if(ch=="(")
			j=j+1;
		if(j > 1)
		   break;
		   
    }
    if(j>1)
      	return true;
    else  
    	return false;
}
function isSecondCloseParen(textValue){
    var j=0;
    for (i = 0;  i < textValue.length;  i++){
		ch = textValue.charAt(i);
		if(ch==")")
			j=j+1;
		if(j > 1)
		   break;
		   
    }
    if(j>1)
      	return true;
    else  
    	return false;
}
function isSecondHypen(textValue){
	var j=0;
    for (i = 0;  i < textValue.length;  i++){
		ch = textValue.charAt(i);
		if(ch=="-")
			j=j+1;
		if(j > 1)
		   break;
		   
    }
    if(j>1)
      	return true;
    else  
    	return false;
}
function isSecondPlus(textValue){
    var j=0;
    for (i = 0;  i < textValue.length;  i++){
		ch = textValue.charAt(i);
		if(ch=="+")
			j=j+1;
		if(j > 1)
		   break;
		   
    }
    if(j>1)
      	return true;
    else  
    	return false;
}
function checkEmail(w_ObjVal)
{
	if(w_ObjVal.search(/^[a-z0-9]+((\.|!|_|\+|\-)[a-z0-9]+)*@([a-z0-9]+(\.|\-))+[a-z0-9]{2,}$/i)!= -1)
   	{
		return true;
   	}else{
		return false;
	}	
}

function isZero(val)	{
	if(val == undefined || val == 0)  {
		return true;
	}
	return false;
}		
function checkDate(text){
		var textLength=text.length;
		for(i=0;i<textLength;i++){
			if((text.charCodeAt(i)<48||text.charCodeAt(i)>57)){
              if(text.charCodeAt(i)!=45){
               return false;
              } 
            }   
		}//end of for
		return true;	
	}