
var drawMultilineText = function(){
    // set context and formatting
	var fv = $('#textInput').css('font-family');
	var size = $('#textInput').css('font-size');
	var canvas = document.getElementById("canvas")
    var context = canvas.getContext('2d');
	var x = $('#hOffset').val();
	context.clearRect(0,0,940,400);
	context.drawImage( (document.getElementById('img_elem') ), 0, 0, 940, 400);
    context.textAlign = "left";
    context.textBaseline = "top";
    context.fillStyle = $('#colorSelector img').css('background-color');
	context.font =  size + " " + fv;
	context.textAlign = 'left';
    // prepare textarea value to be drawn as multiline text.
    var textval = document.getElementById("textInput").value;
    var textvalArr = toMultiLine(textval);
    console.log('linespacing: ' + linespacing + ' textval: ' + textval + 'textvalArr: ' +textvalArr);
	var y = parseInt($('#vOffset').val());
   	var linespacing = parseInt(parseInt(size.match(/\d\d/)));

    // draw each line on canvas. 
    for(var i = 0; i < textvalArr.length; i++){
        context.fillText(textvalArr[i], x, y);
//			context.strokeStyle = $('#strokeSelector img').css('background-color');
//			context.strokeText(textvalArr[i], x, y);
        y += linespacing;
        console.log(y + "lsp " + linespacing);
    }
	}
// Creates an array where the <br/> tag splits the values.
var toMultiLine = function(text){
   var textArr = new Array();
   text = text.replace(/\n\r?/g, '<br/>');
   textArr = text.split("<br/>");
   return textArr;
	};

$(document).ready(function() {
	$('#img_elem, #canvas').hide()
	$('#colorSelector img').css('backgroundColor', '#000000');
	$('#hOffset').change(
		function()	{
			$('#textInput').css('margin-left', $('#hOffset').val() + 'px' );
		}
	);
	$('#vOffset').change(
		function()	{
			$('#textInput').css('margin-top', $('#vOffset').val() + 'px' );
		}
	);
	$('#size').change(
		function() {
			$('#textInput').css('font-size', $('#size').val() + 'pt' );
		}
	);
	$('#chooseImage').click(function() {
		$.ajax({url: '/backgrounds/list', dataType: 'html', type: 'GET', success: function(data) {say(data)}});
	});
		$('#colorSelector').ColorPicker({
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb, hex, rgb) {
			$('#colorSelector img').css('backgroundColor', '#' + hex);
			$('#textInput').css('color', '#' + hex );
		}
	});
	$('#strokeSelector').ColorPicker({
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb, hex, rgb) {
			$('#strokeSelector img').css('backgroundColor', '#' + hex);
			$('#textInput').css('-webkit-text-stroke', '1px #' + hex);

		}
	});
	$('#align').change(function() {
		$('#textInput').css('text-align', $(this).val());
	});
	$('.fontSelect').click(function(){
		$('#textInput').css('font-family', $(this).text());
	});
	$.each($('.fontSelect'), function(index, value) { 
			$(value).css('font-family', $(value).text())
	});
	$('#toolPallet div').mouseover(function() {
		$(this).css('background-color', 'grey');
	}).mouseout(function() {
		$(this).css('background-color', '#c2c2c2');}).click(function(){$(this).css('background-color', '#c2c2c2')
	});
	$('#save').mouseover(function() {$('#save').css('background-color', '#ff5252')}).mouseout(function() {$('#save').css('background-color', 'red')});
	$('#save').click(function() {
		drawMultilineText();
		var dataURL = canvas.toDataURL("image/png");
		var base64 = dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
		$.post('/puzzles/upload', {base64: base64, puzzleTitle: puzzleTitle.value},
			function() {window.location = "/puzzles/" + puzzleTitle.value + '/show'});
	});
	$('#puzzleTitle').click(function() {$(this).val("")});
});