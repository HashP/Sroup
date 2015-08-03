/**
 * 
 */

	
var form = {};

(function(myModule){
	
	myModule.error = function(el) {
		el.parent().removeClass("has-success");
		el.parent().children("span").remove()
		el.parent().addClass("has-error has-feedback")
		el.parent().append("<span class='glyphicon glyphicon-remove form-control-feedback' aria-hidden='true'></span>");
		el.siblings(".error-message").show();	
	}
	
	myModule.success = function(el) {
		el.parent().removeClass("has-error");
		el.parent().children("span").remove()
		el.parent().addClass("has-success has-feedback")
		el.parent().append("<span class='glyphicon glyphicon-ok form-control-feedback' aria-hidden='true'></span>");
		el.siblings(".error-message").hide();	
	}
	
	myModule.clear = function(el) {
		el.parent().removeClass("has-error has-success");
		el.parent().children("span").remove();
		el.siblings(".error-message").hide();	
	}
	
})(form);









