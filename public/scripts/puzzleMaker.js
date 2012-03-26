
var drawCanvas = function(){
    // set context and formatting
	var fv = $('#canvas').css('font-family');
	var size = $('#canvas').css('font-size');
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
    var textval = document.getElementById("puzzleBody").value;
    var textvalArr = toMultiLine(textval);
	var y = parseInt($('#vOffset').val());
   	var linespacing = parseInt(parseInt(size.match(/\d\d/)));
    console.log('linespacing: ' + linespacing + ' textval: ' + textval + 'textvalArr: ' +textvalArr);

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
	drawCanvas();
	$('#img_elem').hide();
	$('#colorSelector img').css('backgroundColor', '#000000');
	$('#hOffset').change(
		function()	{
			drawCanvas();
		}
	);
	$('#vOffset').change(
		function()	{
			drawCanvas();
		}
	);
	$('#size').change(
		function() {
			$('#canvas').css('font-size', $('#size').val() + 'pt' );
			drawCanvas();
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
			$('#canvas').css('color', '#' + hex );
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
			$('#canvas').css('-webkit-text-stroke', '1px #' + hex);

		}
	});
	$('#align').change(function() {
		$('#canvas').css('text-align', $(this).val());
	});
	$('.fontSelect').click(function(){
		$('#canvas').css('font-family', $(this).text());
		drawCanvas();
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
		drawCanvas();
		var dataURL = canvas.toDataURL("image/png");
		var base64 = dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
		$.post('/puzzles/upload', {base64: base64, puzzleTitle: puzzleTitle.value},
			function() {window.location = "/puzzles/" + puzzleTitle.value + '/show'});
	});
	$('#puzzleTitle').click(function() {$(this).val("")});
	$('#puzzleBody').keyup( function () {
		drawCanvas();
	});
});
