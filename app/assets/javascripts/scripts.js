(function(){
	$('select').on('change',function(){

		$.ajax({
		    url: $(this).children("option").filter(":selected").val(),
		    data: { select_tag_query: $(this).children("option").filter(":selected").text().toLowerCase(),
		    		select_tag_param: $(this).attr('value')
			},
		    cache: false,
		    dataType: "script"
		});
	});
	$(document).on('click', '.show-receipts .pagination a', function(){
		$.getScript(this.href);
		return false;
	});
})();