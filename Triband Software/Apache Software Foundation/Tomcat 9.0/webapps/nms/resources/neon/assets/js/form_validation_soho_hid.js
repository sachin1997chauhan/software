function cfCalculator800() {
	validateStartStop800();
	calc800UL();
	calc800DL();
	calc800();
}

function cfCalculator850() {
	validateStartStop850();
	calc850UL();
	calc850DL();
	calc850();
}

function cfCalculator900() {
	validateStartStop900();
	calc900UL();
	calc900DL();
	calc900();
}

function cfCalculator1800() {
	validateStartStop1800();
	calc1800UL();
	calc1800DL();
	calc1800();
}

function cfCalculator2100() {
	validateStartStop2100();
	calc2100UL();
	calc2100DL();
	calc2100();
}

/* 800 Band */

function validateStartStop800() {
	var start = parseFloat(document.getElementById("startchg80").value);
	var stop = parseFloat(document.getElementById("stopchg80").value);
	if (start > stop) {
		start = stop;
		document.getElementById("startchg80").value = start;
	}
}

function calc800UL() {
	var start = parseFloat(document.getElementById("startchg80").value);
	var stop = parseFloat(document.getElementById("stopchg80").value);
	var result = parseFloat((start + (stop - start) / 2));
	result = result.toFixed(1);
	document.getElementById("lofrequl80").value = result;
}

function calc800DL() {

	var n1 = parseFloat(document.getElementById("lofrequl80").value);
	var y = 41.00;
	var elem = parseFloat(n1 - y);
	document.getElementById("lofreqdl80").value = elem;

}

function calc800() {
	var n1 = parseFloat(document.getElementById('stopchg80').value);
	var n2 = parseFloat(document.getElementById('startchg80').value);
	var result = parseFloat((n1 - n2));
	result = result.toFixed(2);

	var bandwidth = result.toString();
	var afterDot = bandwidth.substring(bandwidth.indexOf('.') + 1,
			bandwidth.length - 1);

	var b = parseInt(afterDot);

	if (result == 0.00) {
		document.getElementById('bwg80').value = 0.20;

	} else {
		document.getElementById('bwg80').value = result;
	}

	if (b % 2 == 0 && n1 != n2) {

		document.getElementById('bwg80').value = result;
		document.getElementById("bwg80").style.color = "white";
		document.getElementById("apply_800").disabled = false;
	} else if (n1 == n2) {
		document.getElementById("apply_800").disabled = true;
	} else {
		alert("Invalid Bandwidth...");
		document.getElementById('bwg80').value = result;
		document.getElementById("bwg80").style.color = "orange";
		document.getElementById("apply_800").disabled = true;
	}
}

/* 850 Band */
function calc850UL() {
	var start = parseFloat(document.getElementById("startchg85").value);
	var stop = parseFloat(document.getElementById("stopchg85").value);
	var result = parseFloat((start + (stop - start) / 2));
	result = result.toFixed(1);
	document.getElementById("lofrequl85").value = result;
}
function calc850DL() {

	var n1 = parseFloat(document.getElementById("lofrequl85").value);
	var y = 41.00;
	var elem = parseFloat(n1 - y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdl85").value = elem;
}

function validateStartStop850() {
	var start = parseFloat(document.getElementById("startchg85").value);
	var stop = parseFloat(document.getElementById("stopchg85").value);
	if (start > stop) {
		start = stop;
		document.getElementById("startchg85").value = start;
	}
}

function calc850() {
	var n1 = parseFloat(document.getElementById('stopchg85').value);
	var n2 = parseFloat(document.getElementById('startchg85').value);
	var result = parseFloat((n1 - n2));

	result = result.toFixed(2);

	var bandwidth = result.toString();
	var afterDot = bandwidth.substring(bandwidth.indexOf('.') + 1,
			bandwidth.length - 1);

	var b = parseInt(afterDot);

	if (result == 0.00) {
		document.getElementById('bwg85').value = 0.20;

	} else {
		document.getElementById('bwg85').value = result;
	}

	if (b % 2 == 0 && n1 != n2) {

		document.getElementById('bwg85').value = result;
		document.getElementById("bwg85").style.color = "white";
		document.getElementById("apply_850").disabled = false;
	} else if (n1 == n2) {
		document.getElementById("apply_850").disabled = true;
	} else {
		alert("Invalid Bandwidth...");
		document.getElementById('bwg85').value = result;
		document.getElementById("bwg85").style.color = "orange";
		document.getElementById("apply_850").disabled = true;
	}
}

/* 900 Band */
function validateStartStop900() {
	var start = parseFloat(document.getElementById("startchg90").value);
	var stop = parseFloat(document.getElementById("stopchg90").value);
	if (start > stop) {
		start = stop;
		document.getElementById("startchg90").value = start;
	}
}

function calc900UL() {
	var start = parseFloat(document.getElementById("startchg90").value);
	var stop = parseFloat(document.getElementById("stopchg90").value);
	var result = parseFloat((start + (stop - start) / 2));
	result = result.toFixed(1);
	document.getElementById("lofrequl90").value = result;
}
function calc900DL() {

	var n1 = parseFloat(document.getElementById("lofrequl90").value);
	var y = 45.00;
	var elem = parseFloat(n1 + y);
	document.getElementById("lofreqdl90").value = elem;
}

function calc900() {
	var n1 = parseFloat(document.getElementById('stopchg90').value);
	var n2 = parseFloat(document.getElementById('startchg90').value);
	var result = parseFloat((n1 - n2));

	result = result.toFixed(2);

	var bandwidth = result.toString();
	var afterDot = bandwidth.substring(bandwidth.indexOf('.') + 1,
			bandwidth.length - 1);

	var b = parseInt(afterDot);

	if (result == 0.00) {
		document.getElementById('bwg90').value = 0.20;

	} else {
		document.getElementById('bwg90').value = result;
	}

	if (b % 2 == 0 && n1 != n2) {

		document.getElementById('bwg90').value = result;
		document.getElementById("bwg90").style.color = "white";
		document.getElementById("apply_900").disabled = false;
	} else if (n1 == n2) {
		document.getElementById("apply_900").disabled = true;
	} else {
		alert("Invalid Bandwidth...");
		document.getElementById('bwg90').value = result;
		document.getElementById("bwg90").style.color = "orange";
		document.getElementById("apply_900").disabled = true;
	}
}

/* 1800 Band */
function validateStartStop1800() {
	var start = parseFloat(document.getElementById("startchg180").value);
	var stop = parseFloat(document.getElementById("stopchg180").value);
	if (start > stop) {
		start = stop;
		document.getElementById("startchg180").value = start;
	}
}

function calc1800UL() {
	var start = parseFloat(document.getElementById("startchg180").value);
	var stop = parseFloat(document.getElementById("stopchg180").value);
	var result = parseFloat((start + (stop - start) / 2));
	result = result.toFixed(1);
	document.getElementById("lofrequl180").value = result;
}
function calc1800DL() {

	var n1 = parseFloat(document.getElementById("lofrequl180").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdl180").value = elem;
}

function calc1800() {
	var n1 = parseFloat(document.getElementById('stopchg180').value);
	var n2 = parseFloat(document.getElementById('startchg180').value);
	var result = parseFloat((n1 - n2));

	result = result.toFixed(2);

	var bandwidth = result.toString();
	var afterDot = bandwidth.substring(bandwidth.indexOf('.') + 1,
			bandwidth.length - 1);

	var b = parseInt(afterDot);

	if (result == 0.00) {
		document.getElementById('bwg180').value = 0.20;

	} else {
		document.getElementById('bwg180').value = result;
	}

	if (b % 2 == 0 && n1 != n2) {

		document.getElementById('bwg180').value = result;
		document.getElementById("bwg180").style.color = "white";
		document.getElementById("apply_1800").disabled = false;
	} else if (n1 == n2) {
		document.getElementById("apply_1800").disabled = true;
	} else {
		alert("Invalid Bandwidth...");
		document.getElementById('bwg180').value = result;
		document.getElementById("bwg180").style.color = "orange";
		document.getElementById("apply_1800").disabled = true;
	}
}

/* 2100 Band */
function validateStartStop2100() {
	var start = parseFloat(document.getElementById("startchg210").value);
	var stop = parseFloat(document.getElementById("stopchg210").value);
	if (start > stop) {
		start = stop;
		document.getElementById("startchg210").value = start;
	}
}

function calc2100UL() {
	var start = parseFloat(document.getElementById("startchg210").value);
	var stop = parseFloat(document.getElementById("stopchg210").value);
	var result = parseFloat((start + (stop - start) / 2));
	result = result.toFixed(1);
	document.getElementById("lofrequl210").value = result;
}
function calc2100DL() {

	var n1 = parseFloat(document.getElementById("lofrequl210").value);
	var y = 190.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdl210").value = elem;
}

function calc2100() {
	console.log("Inside 2100 BW");
	var n1 = parseFloat(document.getElementById('stopchg210').value);
	var n2 = parseFloat(document.getElementById('startchg210').value);
	var result = parseFloat((n1 - n2));
	result = result.toFixed(2);
	/* document.getElementById('bwg0').value = result; */
	console.log(result);

	var bandwidth = result.toString();
	var afterDot = bandwidth.substring(bandwidth.indexOf('.') + 1,
			bandwidth.length - 1);

	var b = parseInt(afterDot);

	if (result == 0.00) {
		document.getElementById('bwg210').value = 0.20;
	} else {
		document.getElementById('bwg210').value = result;
	}

	if (b % 2 == 0 && n1 != n2) {

		document.getElementById('bwg210').value = result;
		document.getElementById("bwg210").style.color = "white";
		document.getElementById("apply_2100").disabled = false;
	} else if (n1 == n2) {
		document.getElementById("apply_2100").disabled = true;
	} else {
		alert("Invalid Bandwidth...");
		document.getElementById('bwg210').value = result;
		document.getElementById("bwg210").style.color = "orange";
		document.getElementById("apply_2100").disabled = true;
	}
}
