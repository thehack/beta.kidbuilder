/*
Simple Lightbox created by Tim Inman

Website: http://inmans.org
Date: 10 Jan 2011

This is good for one-liners, but needs some work for larger boxes.
At the minute it requires prototype for the observe line.
*/
//for jslint
/*global window: false */
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
		overlay.fade();
		alertbox.fade();
		setTimeout(function () {window.location = '/'; }, 500);
	};
	overlay.style.width = myWidth + 'px';
	overlay.style.height = myHeight + 'px';
	
	overlay.id = 'overlay';
	document.body.appendChild(overlay);
	closebox.href = '#';
	closebox.innerHTML = "x";
	closebox.id = "closebox";
	alertbox.style.left = (myWidth / 2) - 112 + 'px';	
	alertbox.style.top = (myHeight / 2) - 200 + 'px';
	alertbox.id = 'alertbox';
	paratext.id = 'paratext';
	paratext.innerHTML = message.toString();
	document.body.appendChild(alertbox);
	alertbox.appendChild(closebox);
	alertbox.appendChild(paratext);
	closebox.observe('click', closeUp);
};
