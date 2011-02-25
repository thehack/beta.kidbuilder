/*

Simple Lightbox created by Tim Inman

Chris Campbell
Website: http://inmans.org
Date: 10 Jan 2011

This is good for one-liners, but needs some work for larger boxes.
*/

var say = function (message) {
// if (alertbox != null) {closeUp();}
	var alertbox = document.createElement('div');
	var paratext = document.createElement('p');
	var closebox = document.createElement('a');
	var overlay = document.createElement('div');
	overlay.style.width = (document.width) +'px';
	overlay.style.height = (document.height) + 'px';
	overlay.id = 'overlay';
	document.body.appendChild(overlay);
	closebox.href = "javascript:closeUp();"
	closebox.innerHTML = "x";
	closebox.id = "closebox";
	alertbox.style.left = (document.width - alertbox.style.width)/2 -50 +'px';	
	alertbox.id = 'alertbox';
	paratext.id = 'paratext';
	paratext.innerHTML = message.toString();
	document.body.appendChild(alertbox);
	alertbox.appendChild(closebox);
	alertbox.appendChild(paratext);
}; 

var closeUp = function() {
	$('overlay').fade();
	$('alertbox').fade();
	setTimeout(function(){window.location='/'}, 1500);
}