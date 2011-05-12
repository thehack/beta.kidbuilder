/*
Simple Modal Window for Prototype
Replacement for Alert Dialogue

Tim Inman
Website: http://inmans.org
Date: 10 Jan 2011
*/

//You can use this inline, like an alert.
// Still need to take in to account the actual width of the alert in centering.
var say = function (message) {
	var alertbox, paratext, closebox, overlay, myWidth = 0, myHeight = 0;
	var closeUp = function () {
		if ($('paratext').children[0]) {
			$('body').insert( $('paratext').children[0].hide() );
		}
		else {
			$('body').insert( $('paratext').hide() );
		}
		overlay.remove();
		alertbox.remove();
	};
	alertbox = document.createElement('div');
	paratext = document.createElement('p');
	closebox = document.createElement('a');
	overlay = document.createElement('div');
	myWidth = document.viewport.getDimensions().width;
	myHeight = document.viewport.getDimensions().height;
	overlay.setAttribute("style", "position:absolute; top:0px; left:0px; z-index:5; background-color:white; opacity: 0.5;");
	overlay.style.width = myWidth + 'px';
	overlay.style.height = [ myHeight, 776 ].max()  + 'px';
	overlay.id = 'overlay';
	document.body.appendChild(overlay);
	closebox.href = '#';
	closebox.innerHTML = "x";
	closebox.id = "closebox";
	closebox.setAttribute("style", "font-family:sans-serif;font-size:30px;margin:20px 20px 0px 20px;color: #666666;text-decoration:none;");
	alertbox.appendChild(closebox);
	alertbox.setAttribute("style", "border-radius:8px;-moz-border-radius:8px;text-align:right;position: absolute;border: 2px solid #666666;background-image: -moz-linear-gradient(top, #fcfcfc, #f7f7f7 3%, #f2f2f2 12%, #cbcbcb 90%, #a3a3a3);background-image: -webkit-gradient(linear, center top, center bottom, from(#fcfcfc), to(#a3a3a3), color-stop(3%, #f7f7f7), color-stop(12%, #f2f2f2), color-stop(90%, #cbcbcb));box-shadow: 0 1px 5px rgba(0,0,0,0.75), inset 0 1px 0 white;;z-index:10;margin:20px;");
	alertbox.style.left = (myWidth / 2) - 112 + 'px';	
	alertbox.style.top = (myHeight / 2) - 200 + 'px';
	alertbox.id = 'alertbox';
	paratext.id = 'paratext';
	paratext.innerHTML = message.toString();
	paratext.setAttribute("style", "margin:0px 20px 30px 20px;text-align:center;color:red;font-family:verdana;z-index:20;");	
	document.body.appendChild(alertbox);
	alertbox.appendChild(paratext);
	Event.observe('closebox', 'click', closeUp );
	closebox.onmouseover = function() {
	    this.style.color = "red";
	}
	closebox.onmouseout = function() {
	    this.style.color = "#666666";
	}
};