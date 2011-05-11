/*
Simple Lightbox created by Tim Inman

Website: http://inmans.org
Date: 10 Jan 2011

This is good for one-liners, but needs some work for larger boxes.
I wanted to make it free from dependency, but addEventListener needs sprcucing up for IE. 
Below is the cross-browser event binder. useage: addEvent(element, event, function)
I got this part from: http://net.tutsplus.com/tutorials/javascript-ajax/javascript-from-null-cross-browser-event-binding/
Actually It's not cross-browser yet.  I just realized the fade method is from scriptacluous.
*/
/*global window: false */
var addEvent = (function( window, document ) {  
    if ( document.addEventListener ) {  
        return function( elem, type, cb ) {  
            if ( (elem && !elem.length) || elem === window ) {  
                elem.addEventListener(type, cb, false );  
            }  
            else if ( elem && elem.length ) {  
                var len = elem.length;  
                for ( var i = 0; i < len; i++ ) {  
                    addEvent( elem[i], type, cb );  
                }  
            }  
        };  
    }  
    else if ( document.attachEvent ) {  
        return function ( elem, type, cb ) {  
            if ( (elem && !elem.length) || elem === window ) {  
                elem.attachEvent( 'on' + type, function() { return cb.call(elem, window.event) } );  
            }  
            else if ( elem.length ) {  
                var len = elem.length;  
                for ( var i = 0; i < len; i++ ) {  
                    addEvent( elem[i], type, cb );  
                }  
            }  
        };  
    }  
})( this, document );
//And here is the main code for the say function. This is great for alerts that aren't errors.
var say = function (message) {
	var alertbox, paratext, closebox, overlay, myWidth = 0, myHeight = 0, closeUp;
	alertbox = document.createElement('div');
	paratext = document.createElement('p');
	closebox = document.createElement('a');
	overlay = document.createElement('div');
	if (typeof (window.innerWidth) === 'number') {
    //Non-IE
		myWidth = window.innerWidth;
		myHeight = window.innerHeight;
	} else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
    //IE 6+ in 'standards compliant mode'
		myWidth = document.documentElement.clientWidth;
		myHeight = document.documentElement.clientHeight;
	} else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
    //IE 4 compatible
		myWidth = document.body.clientWidth;
		myHeight = document.body.clientHeight;
	}
	closeUp = function () {
		if ($('paratext').children[0]) {
			$('body').insert( $('paratext').children[0].hide() );
		}
		else {
			$('body').insert( $('paratext').hide() );
		}
		overlay.remove();
		alertbox.remove();
		
	};
	overlay.setAttribute("style", "position:absolute; top:0px; left:0px; z-index:5; background-color:white; opacity: 0.5;");
	overlay.style.width = myWidth + 'px';
	overlay.style.height = myHeight + 'px';
	overlay.id = 'overlay';
	document.body.appendChild(overlay);
	closebox.href = '#';
	closebox.innerHTML = "x";
	closebox.id = "closebox";
	closebox.setAttribute("style", "font-family:sans-serif;font-size:30px;margin:20px;color: #666666;text-decoration:none;");
	alertbox.appendChild(closebox);
	alertbox.setAttribute("style", "text-align:right;position: absolute;border: 2px solid #666666;background-image: -moz-linear-gradient(top, #fcfcfc, #f7f7f7 3%, #f2f2f2 12%, #cbcbcb 90%, #a3a3a3);background-image: -webkit-gradient(linear, center top, center bottom, from(#fcfcfc), to(#a3a3a3), color-stop(3%, #f7f7f7), color-stop(12%, #f2f2f2), color-stop(90%, #cbcbcb));box-shadow: 0 1px 5px rgba(0,0,0,0.75), inset 0 1px 0 white;;z-index:10;margin:20px;");
	alertbox.style.left = (myWidth / 2) - 112 + 'px';	
	alertbox.style.top = (myHeight / 2) - 200 + 'px';
	alertbox.id = 'alertbox';
	paratext.id = 'paratext';
	paratext.innerHTML = message.toString();
	paratext.setAttribute("style", "margin:20px;text-align:center;color:red;font-family:verdana;z-index:20;");	
	document.body.appendChild(alertbox);
	alertbox.appendChild(paratext);
	addEvent(closebox, 'click', closeUp);
	closebox.onmouseover = function() {
	    this.style.color = "red";
	}
	closebox.onmouseout = function() {
	    this.style.color = "#666666";
	}
};