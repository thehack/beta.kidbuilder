	var drawMultilineText = function(){
	    // set context and formatting
		var fv = $('#font').val();
		var size = $('#size').val();
		var canvas = document.getElementById("canvas")
	    var context = canvas.getContext('2d');
		var x = $('#hOffset').val();
	//	var y = $('#vOffset').val();
		context.clearRect(0,0,940,400);
		context.drawImage( (document.getElementById('img_elem') ), 0, 0);
	    context.textAlign = "left";
	    context.textBaseline = "top";
	    context.fillStyle = $('#colorSelector img').css('background-color');
		context.font =  size + 'pt ' + fv;
		context.textAlign = $('#align').val();
	    // prepare textarea value to be drawn as multiline text.
	    var textval = document.getElementById("textarea").value;
	    var textvalArr = toMultiLine(textval);
	    var linespacing = size*1.5;
	//    var x = 2;
	    var y = parseInt($('#vOffset').val());
	    // draw each line on canvas. 
	    for(var i = 0; i < textvalArr.length; i++){

	        context.fillText(textvalArr[i], x, y);
			if ( $('#strokeSelector').hasClass('on') ) {
				context.strokeStyle = $('#strokeSelector img').css('background-color');
				context.strokeText(textvalArr[i], x, y);
			}
			
	        y += linespacing;
	    }
		
	};
	// Creates an array where the <br/> tag splits the values.
	var toMultiLine = function(text){
	   var textArr = new Array();
	   text = text.replace(/\n\r?/g, '<br/>');
	   textArr = text.split("<br/>");
	   return textArr;
	};
	// $(document).ready(function() {drawMultilineText()});