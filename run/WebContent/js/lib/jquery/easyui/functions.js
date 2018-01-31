$.FormatDateTime = function(val) {
	if (val == null || val == '') {
		return '';
	} else {
		var date = new Date(val);
		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
				+ date.getDate() + ' ' + date.getHours() + ':'
				+ date.getMinutes() + ":" + date.getSeconds();
	}
};