//alert("Hello World!");

function applySettings(a) {
	/*
	 * if (a.localeCompare("Update Successfully...")){ a="Waiting..."; } return
	 * a;
	 */
	sendval = "Waiting..."
	return sendval;
}

function cfCalculator900() {
	validateStartStop900();
	calc900UL();
	calc900DL();
	calc900();
}

function cfCalculator800() {
	validateStartStop800();
	calc800UL();
	calc800DL();
	calc800();
}

function cfCalculator2100() {
	validateStartStop2100();
	calc2100UL();
	calc2100DL();
	calc2100();
}

function cfCalculator1800() {
	validateStartStop1800();
	calc1800UL();
	calc1800DL();
	calc1800();
}

function validateStartStop900() {
	var start = parseFloat(document.getElementById("startchg0").value);
	var stop = parseFloat(document.getElementById("stopchg0").value);
	if (start > stop) {
		start = stop;
		document.getElementById("startchg0").value = start;
	}
}

function validateStartStop800() {
	var start = parseFloat(document.getElementById("startchd10").value);
	var stop = parseFloat(document.getElementById("stopchd10").value);
	if (start > stop) {
		start = stop;
		document.getElementById("startchd10").value = start;
	}
}

function calc900UL() {
	var start = parseFloat(document.getElementById("startchg0").value);
	var stop = parseFloat(document.getElementById("stopchg0").value);
	var result = parseFloat((start + (stop - start) / 2));
	result = result.toFixed(1);
	document.getElementById("lofrequl0").value = result;
}
function calc900DL() {

	var n1 = parseFloat(document.getElementById("lofrequl0").value);
	var y = 45.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdl0").value = elem;
}

function calc800UL() {
	var start = parseFloat(document.getElementById("startchd10").value);
	var stop = parseFloat(document.getElementById("stopchd10").value);
	var result = parseFloat((start + (stop - start) / 2));
	result = result.toFixed(1);
	document.getElementById("lofrequld10").value = result;
}
function calc800DL() {

	var n1 = parseFloat(document.getElementById("lofrequld10").value);
	var y = 41.00;
	var elem = parseFloat(n1 - y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld10").value = elem;
}

function validateStartStop2100() {
	var start = parseFloat(document.getElementById("startchg0").value);
	var stop = parseFloat(document.getElementById("stopchg0").value);
	if (start > stop) {
		start = stop;
		document.getElementById("startchg0").value = start;
	}
}

function validateStartStop1800() {
	var start = parseFloat(document.getElementById("startchd10").value);
	var stop = parseFloat(document.getElementById("stopchd10").value);
	if (start > stop) {
		start = stop;
		document.getElementById("startchd10").value = start;
	}
}

function calc2100UL() {
	var start = parseFloat(document.getElementById("startchg0").value);
	var stop = parseFloat(document.getElementById("stopchg0").value);
	var result = parseFloat((start + (stop - start) / 2));
	result = result.toFixed(1);
	document.getElementById("lofrequl0").value = result;
}
function calc2100DL() {

	var n1 = parseFloat(document.getElementById("lofrequl0").value);
	var y = 190.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdl0").value = elem;
}

function calc2100() {
	// console.log("Inside 2100 BW");
	var n1 = parseFloat(document.getElementById('stopchg0').value);
	var n2 = parseFloat(document.getElementById('startchg0').value);
	var result = parseFloat((n1 - n2));
	result = result.toFixed(2);
	/* document.getElementById('bwg0').value = result; */
	console.log(result);

	var bandwidth = result.toString();
	var afterDot = bandwidth.substring(bandwidth.indexOf('.') + 1,
			bandwidth.length - 1);

	var b = parseInt(afterDot);

	if (result == 0.00) {
		document.getElementById('bwg0').value = 0.20;
	} else {
		document.getElementById('bwg0').value = result;
	}

	if (b % 2 == 0 && n1 != n2) {

		document.getElementById('bwg0').value = result;
		document.getElementById("bwg0").style.color = "white";
		document.getElementById("apply_21").disabled = false;
	} else if (n1 == n2) {
		document.getElementById("apply_21").disabled = true;
	} else {
		alert("Invalid Bandwidth...");
		document.getElementById('bwg0').value = result;
		document.getElementById("bwg0").style.color = "orange";
		document.getElementById("apply_21").disabled = true;
	}
}

function calc1800() {
	var n1 = parseFloat(document.getElementById('stopchd10').value);
	var n2 = parseFloat(document.getElementById('startchd10').value);
	var result = parseFloat((n1 - n2));

	result = result.toFixed(2);

	var bandwidth = result.toString();
	var afterDot = bandwidth.substring(bandwidth.indexOf('.') + 1,
			bandwidth.length - 1);

	var b = parseInt(afterDot);

	if (result == 0.00) {
		document.getElementById('bwd10').value = 0.20;

	} else {
		document.getElementById('bwd10').value = result;
	}

	if (b % 2 == 0 && n1 != n2) {

		document.getElementById('bwd10').value = result;
		document.getElementById("bwd10").style.color = "white";
		document.getElementById("apply_18").disabled = false;
	} else if (n1 == n2) {
		document.getElementById("apply_18").disabled = true;
	} else {
		alert("Invalid Bandwidth...");
		document.getElementById('bwd10').value = result;
		document.getElementById("bwd10").style.color = "orange";
		document.getElementById("apply_18").disabled = true;
	}
}

function calc900() {
	// console.log("Inside 900 BW");
	var n1 = parseFloat(document.getElementById('stopchg0').value);
	var n2 = parseFloat(document.getElementById('startchg0').value);
	var result = parseFloat((n1 - n2));
	result = result.toFixed(2);
	/* document.getElementById('bwg0').value = result; */
	console.log(result);

	var bandwidth = result.toString();
	var afterDot = bandwidth.substring(bandwidth.indexOf('.') + 1,
			bandwidth.length - 1);

	var b = parseInt(afterDot);

	if (result == 0.00) {
		document.getElementById('bwg0').value = 0.20;
	} else {
		document.getElementById('bwg0').value = result;
	}

	if (b % 2 == 0 && n1 != n2) {

		document.getElementById('bwg0').value = result;
		document.getElementById("bwg0").style.color = "white";
		document.getElementById("apply_9").disabled = false;
	} else if (n1 == n2) {
		document.getElementById("apply_9").disabled = true;
	} else {
		alert("Invalid Bandwidth...");
		document.getElementById('bwg0').value = result;
		document.getElementById("bwg0").style.color = "orange";
		document.getElementById("apply_9").disabled = true;
	}
}

function calc800() {

	var n1 = parseFloat(document.getElementById('stopchd10').value);
	var n2 = parseFloat(document.getElementById('startchd10').value);
	var result = parseFloat((n1 - n2));

	result = result.toFixed(2);

	var bandwidth = result.toString();
	var afterDot = bandwidth.substring(bandwidth.indexOf('.') + 1,
			bandwidth.length - 1);

	var b = parseInt(afterDot);

	if (result == 0.00) {
		document.getElementById('bwd10').value = 0.20;

	} else {
		document.getElementById('bwd10').value = result;
	}

	if (b % 2 == 0 && n1 != n2) {

		document.getElementById('bwd10').value = result;
		document.getElementById("bwd10").style.color = "white";
		document.getElementById("apply_8").disabled = false;
	} else if (n1 == n2) {
		document.getElementById("apply_8").disabled = true;
	} else {
		alert("Invalid Bandwidth...");
		document.getElementById('bwd10').value = result;
		document.getElementById("bwd10").style.color = "orange";
		document.getElementById("apply_8").disabled = true;
	}
}

function calc1800UL() {
	var start = parseFloat(document.getElementById("startchd10").value);
	var stop = parseFloat(document.getElementById("stopchd10").value);
	var result = parseFloat((start + (stop - start) / 2));
	result = result.toFixed(1);
	document.getElementById("lofrequld10").value = result;
}
function calc1800DL() {

	var n1 = parseFloat(document.getElementById("lofrequld10").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld10").value = elem;
}

function cfCalculatorGSMh0() {
	validateStartStopGSMh0();
	calcGSMCFULh0();
	calcGSMCFDLh0();
	calcGh0();
}

function validateStartStopGSMh0() {
	var start = parseInt(document.getElementById("startchg0").value);
	var stop = parseInt(document.getElementById("stopchg0").value);
	if (stop != start) {
		stop = start;
		document.getElementById("stopchg0").value = stop;
	}
}

function validateStartStopDCS1h0() {
	var start = parseInt(document.getElementById("startchd10").value);
	var stop = parseInt(document.getElementById("stopchd10").value);
	if (stop != start) {
		stop = start;
		document.getElementById("stopchd10").value = stop;
	}
}

function validateStartStopDCS2h0() {
	var start = parseInt(document.getElementById("startchd20").value);
	var stop = parseInt(document.getElementById("stopchd20").value);
	if (stop != start) {
		stop = start;
		document.getElementById("stopchd20").value = stop;
	}
}

function validateStartStopUMTSh0() {
	var start = parseInt(document.getElementById("startchu0").value);
	var stop = parseInt(document.getElementById("stopchu0").value);
	if (stop != start) {
		stop = start;
		document.getElementById("stopchu0").value = stop;
	}
}

function calcGSMCFULh0() {
	var start = parseInt(document.getElementById("startchg0").value);
	var stop = parseInt(document.getElementById("stopchg0").value);
	var result = parseFloat(890.2 + 0.2 * ((start + (stop - start) / 2) - 1));
	result = result.toFixed(1);
	document.getElementById("lofrequl0").value = result;
}
function calcGSMCFDLh0() {

	var n1 = parseFloat(document.getElementById("lofrequl0").value);
	var y = 45.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdl0").value = elem;
}

function cfCalculatorGSMh1() {
	validateStartStopGSMh1();
	calcGSMCFULh1();
	calcGSMCFDLh1();
	calcGh1();
}

function cfCalculatorGSMh1_Stop() {
	validateStartStopGSMh1_Stop();
	calcGSMCFULh1();
	calcGSMCFDLh1();
	calcGh1();
}

/*
 * function validateStartStopGSMh1() { var start =
 * parseInt(document.getElementById("startchg1").value); var stop =
 * parseInt(document.getElementById("stopchg1").value); if (stop <= start) {
 * start = stop; document.getElementById("startchg1").value = start; } }
 */

function validateStartStopGSMh1() {
	var start = parseInt(document.getElementById("startchg1").value);
	var stop = parseInt(document.getElementById("stopchg1").value);

	if ((0 < start && start < 125) && stop <= start) {

		start = stop;
		document.getElementById("startchg1").value = start;

	} else if ((124 < start && start < 174) && stop <= start) {
		start = start + 850;
		stop = start;
		document.getElementById("startchg1").value = start;
		document.getElementById("stopchg1").value = stop;
	} else if (173 < start && start < 975) {

		alert("Start/Stop Channel value must be between 1 to 173");

		document.getElementById("stopchg1").value = 1;
		document.getElementById("startchg1").value = 1;
	} else if (start > 1023) {
		alert("Start/Stop Channel value must be between 1 to 173");
		document.getElementById("stopchg1").value = 124;
		document.getElementById("startchg1").value = 124;
	}
}

function validateStartStopGSMh1_Stop() {
	var start = parseInt(document.getElementById("startchg1").value);
	var stop = parseInt(document.getElementById("stopchg1").value);

	if ((0 < stop && stop < 125) && stop <= start) {

		start = stop;
		document.getElementById("startchg1").value = start;
	} else if ((124 < stop && stop < 174) && stop >= start) {
		stop = stop + 850;
		start = stop;
		document.getElementById("stopchg1").value = stop;
		document.getElementById("startchg1").value = start;
	} else if (173 < stop && stop < 975) {

		alert("Start/Stop Channel value must be between 1 to 173");

		document.getElementById("stopchg1").value = 1;
		document.getElementById("startchg1").value = 1;
	} else if (start > 1023 || stop > 1023) {
		alert("Start/Stop Channel valuemust be between 1 to 173");
		document.getElementById("stopchg1").value = 124;
		document.getElementById("startchg1").value = 124;
	}
}

function calcGSMCFULh1() {
	var start = parseInt(document.getElementById("startchg1").value);
	var stop = parseInt(document.getElementById("stopchg1").value);
	if ((start >= 975 && start <= 1023) && (stop >= 975 && stop <= 1023)) {
		var result = parseFloat(890.2 + 0.2 * ((start + (stop - start) / 2) - 1023));
		result = result.toFixed(1);
		document.getElementById("lofrequl1").value = result;
		console.log("Inside PGSM");
	} else if ((start >= 1 && start <= 124) && (stop >= 1 && stop <= 124)) {
		var result = parseFloat(890.2 + 0.2 * ((start + (stop - start) / 2) - 1));
		result = result.toFixed(1);
		document.getElementById("lofrequl1").value = result;
		console.log("Inside EGSM");
	}
}
function calcGSMCFDLh1() {

	var n1 = parseFloat(document.getElementById("lofrequl1").value);
	var y = 45.00;
	var elem = parseFloat(n1 + y);
	document.getElementById("lofreqdl1").value = elem;
}

function cfCalculatorGSMh2() {
	validateStartStopGSMh2();
	calcGSMCFULh2();
	calcGSMCFDLh2();
	calcGh2();
}

function cfCalculatorGSMh2_Stop() {
	validateStartStopGSMh2_Stop();
	calcGSMCFULh2();
	calcGSMCFDLh2();
	calcGh2();
}

/*
 * function validateStartStopGSMh2() { var start =
 * parseInt(document.getElementById("startchg2").value); var stop =
 * parseInt(document.getElementById("stopchg2").value); if (stop <= start) {
 * start = stop; document.getElementById("startchg2").value = start; } }
 */

function validateStartStopGSMh2() {
	var start = parseInt(document.getElementById("startchg2").value);
	var stop = parseInt(document.getElementById("stopchg2").value);

	if ((0 < start && start < 125) && stop <= start) {

		start = stop;
		document.getElementById("startchg2").value = start;

	} else if ((124 < start && start < 174) && stop <= start) {
		start = start + 850;
		stop = start;
		document.getElementById("startchg2").value = start;
		document.getElementById("stopchg2").value = stop;
	} else if (173 < start && start < 975) {

		alert("Start/Stop Channel value must be between 1 to 173");

		document.getElementById("stopchg2").value = 1;
		document.getElementById("startchg2").value = 1;
	} else if (start > 1023) {
		alert("Start/Stop Channel value must be between 1 to 173");
		document.getElementById("stopchg2").value = 124;
		document.getElementById("startchg2").value = 124;
	}
}

function validateStartStopGSMh2_Stop() {
	var start = parseInt(document.getElementById("startchg2").value);
	var stop = parseInt(document.getElementById("stopchg2").value);

	if ((0 < stop && stop < 125) && stop <= start) {

		start = stop;
		document.getElementById("startchg2").value = start;
	} else if ((124 < stop && stop < 174) && stop >= start) {
		stop = stop + 850;
		start = stop;
		document.getElementById("stopchg2").value = stop;
		document.getElementById("startchg2").value = start;
	} else if (173 < stop && stop < 975) {

		alert("Start/Stop Channel value must be between 1 to 173");

		document.getElementById("stopchg2").value = 1;
		document.getElementById("startchg2").value = 1;
	} else if (start > 1023 || stop > 1023) {
		alert("Start/Stop Channel valuemust be between 1 to 173");
		document.getElementById("stopchg2").value = 124;
		document.getElementById("startchg2").value = 124;
	}
}

function calcGSMCFULh2() {
	var start = parseInt(document.getElementById("startchg2").value);
	var stop = parseInt(document.getElementById("stopchg2").value);

	if ((start >= 975 && start <= 1023) && (stop >= 975 && stop <= 1023)) {
		var result = parseFloat(890.2 + 0.2 * ((start + (stop - start) / 2) - 1023));
		result = result.toFixed(1);
		document.getElementById("lofrequl2").value = result;
	} else if ((start >= 1 && start <= 124) && (stop >= 1 && stop <= 124)) {
		var result = parseFloat(890.2 + 0.2 * ((start + (stop - start) / 2) - 1));
		result = result.toFixed(1);
		document.getElementById("lofrequl2").value = result;
	}

}
function calcGSMCFDLh2() {

	var n1 = parseFloat(document.getElementById("lofrequl2").value);
	var y = 45.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdl2").value = elem;
}

function cfCalculatorGSMh3() {
	validateStartStopGSMh3();
	calcGSMCFULh3();
	calcGSMCFDLh3();
	calcGh3();
}

function cfCalculatorGSMh3_Stop() {
	validateStartStopGSMh3_Stop();
	calcGSMCFULh3();
	calcGSMCFDLh3();
	calcGh3();
}

/*
 * function validateStartStopGSMh3() { var start =
 * parseInt(document.getElementById("startchg3").value); var stop =
 * parseInt(document.getElementById("stopchg3").value); if (stop <= start) {
 * start = stop; document.getElementById("startchg3").value = start; } }
 */

function validateStartStopGSMh3() {
	var start = parseInt(document.getElementById("startchg3").value);
	var stop = parseInt(document.getElementById("stopchg3").value);

	if ((0 < start && start < 125) && stop <= start) {

		start = stop;
		document.getElementById("startchg3").value = start;

	} else if ((124 < start && start < 174) && stop <= start) {
		start = start + 850;
		stop = start;
		document.getElementById("startchg3").value = start;
		document.getElementById("stopchg3").value = stop;
	} else if (173 < start && start < 975) {

		alert("Start/Stop Channel value must be between 1 to 173");

		document.getElementById("stopchg3").value = 1;
		document.getElementById("startchg3").value = 1;
	} else if (start > 1023) {
		alert("Start/Stop Channel value must be between 1 to 173");
		document.getElementById("stopchg3").value = 124;
		document.getElementById("startchg3").value = 124;
	}
}

function validateStartStopGSMh3_Stop() {
	var start = parseInt(document.getElementById("startchg3").value);
	var stop = parseInt(document.getElementById("stopchg3").value);

	if ((0 < stop && stop < 125) && stop <= start) {

		start = stop;
		document.getElementById("startchg3").value = start;
	} else if ((124 < stop && stop < 174) && stop >= start) {
		stop = stop + 850;
		start = stop;
		document.getElementById("stopchg3").value = stop;
		document.getElementById("startchg3").value = start;
	} else if (173 < stop && stop < 975) {

		alert("Start/Stop Channel value must be between 1 to 173");

		document.getElementById("stopchg3").value = 1;
		document.getElementById("startchg3").value = 1;
	} else if (start > 1023 || stop > 1023) {
		alert("Start/Stop Channel valuemust be between 1 to 173");
		document.getElementById("stopchg3").value = 124;
		document.getElementById("startchg3").value = 124;
	}
}

function calcGSMCFULh3() {
	var start = parseInt(document.getElementById("startchg3").value);
	var stop = parseInt(document.getElementById("stopchg3").value);

	if ((start >= 975 && start <= 1023) && (stop >= 975 && stop <= 1023)) {
		var result = parseFloat(890.2 + 0.2 * ((start + (stop - start) / 2) - 1023));
		result = result.toFixed(1);
		document.getElementById("lofrequl3").value = result;
	} else if ((start >= 1 && start <= 124) && (stop >= 1 && stop <= 124)) {
		var result = parseFloat(890.2 + 0.2 * ((start + (stop - start) / 2) - 1));
		result = result.toFixed(1);
		document.getElementById("lofrequl3").value = result;
	}
}

function calcGSMCFDLh3() {

	var n1 = parseFloat(document.getElementById("lofrequl3").value);
	var y = 45.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdl3").value = elem;
}

function cfCalculatorGSMh4() {
	validateStartStopGSMh4();
	calcGSMCFULh4();
	calcGSMCFDLh4();
	calcGh4();
}

function cfCalculatorGSMh4_Stop() {
	validateStartStopGSMh4_Stop();
	calcGSMCFULh4();
	calcGSMCFDLh4();
	calcGh4();
}

/*
 * function validateStartStopGSMh4() { var start =
 * parseInt(document.getElementById("startchg4").value); var stop =
 * parseInt(document.getElementById("stopchg4").value); if (stop <= start) {
 * start = stop; document.getElementById("startchg4").value = start; } }
 */

function validateStartStopGSMh4() {
	var start = parseInt(document.getElementById("startchg4").value);
	var stop = parseInt(document.getElementById("stopchg4").value);

	if ((0 < start && start < 125) && stop <= start) {

		start = stop;
		document.getElementById("startchg4").value = start;

	} else if ((124 < start && start < 174) && stop <= start) {
		start = start + 850;
		stop = start;
		document.getElementById("startchg4").value = start;
		document.getElementById("stopchg4").value = stop;
	} else if (173 < start && start < 975) {

		alert("Start/Stop Channel value must be between 1 to 173");

		document.getElementById("stopchg4").value = 1;
		document.getElementById("startchg4").value = 1;
	} else if (start > 1023) {
		alert("Start/Stop Channel value must be between 1 to 173");
		document.getElementById("stopchg4").value = 124;
		document.getElementById("startchg4").value = 124;
	}
}

function validateStartStopGSMh4_Stop() {
	var start = parseInt(document.getElementById("startchg4").value);
	var stop = parseInt(document.getElementById("stopchg4").value);

	if ((0 < stop && stop < 125) && stop <= start) {

		start = stop;
		document.getElementById("startchg4").value = start;
	} else if ((124 < stop && stop < 174) && stop >= start) {
		stop = stop + 850;
		start = stop;
		document.getElementById("stopchg4").value = stop;
		document.getElementById("startchg4").value = start;
	} else if (173 < stop && stop < 975) {

		alert("Start/Stop Channel value must be between 1 to 173");

		document.getElementById("stopchg4").value = 1;
		document.getElementById("startchg4").value = 1;
	} else if (start > 1023 || stop > 1023) {
		alert("Start/Stop Channel valuemust be between 1 to 173");
		document.getElementById("stopchg4").value = 124;
		document.getElementById("startchg4").value = 124;
	}
}

function calcGSMCFULh4() {
	var start = parseInt(document.getElementById("startchg4").value);
	var stop = parseInt(document.getElementById("stopchg4").value);

	if ((start >= 975 && start <= 1023) && (stop >= 975 && stop <= 1023)) {
		var result = parseFloat(890.2 + 0.2 * ((start + (stop - start) / 2) - 1023));
		result = result.toFixed(1);
		document.getElementById("lofrequl4").value = result;
	} else if ((start >= 1 && start <= 124) && (stop >= 1 && stop <= 124)) {
		var result = parseFloat(890.2 + 0.2 * ((start + (stop - start) / 2) - 1));
		result = result.toFixed(1);
		document.getElementById("lofrequl4").value = result;
	}
}
function calcGSMCFDLh4() {

	var n1 = parseFloat(document.getElementById("lofrequl4").value);
	var y = 45.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdl4").value = elem;
}

function calcGh1() {

	var n1 = parseInt(document.getElementById('stopchg1').value);
	var n2 = parseInt(document.getElementById('startchg1').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwg1').value = result;
}

function calcGh2() {

	var n1 = parseInt(document.getElementById('stopchg2').value);
	var n2 = parseInt(document.getElementById('startchg2').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	document.getElementById('bwg2').value = result;
}

function calcGh3() {

	var n1 = parseInt(document.getElementById('stopchg3').value);
	var n2 = parseInt(document.getElementById('startchg3').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwg3').value = result;
}

function calcGh4() {

	var n1 = parseInt(document.getElementById('stopchg4').value);
	var n2 = parseInt(document.getElementById('startchg4').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwg4').value = result;
}

// for dcs1 hump 0
function cfCalculatorDCS1h0() {
	validateStartStopDCS1h0();
	calcDCS1CFULh0();
	calcDCS1CFDLh0();
	calcD1h0();
}

function calcDCS1CFULh0() {
	var start = parseInt(document.getElementById("startchd10").value);
	var stop = parseInt(document.getElementById("stopchd10").value);
	var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
	result = result.toFixed(1);
	document.getElementById("lofrequld10").value = result;
}
function calcDCS1CFDLh0() {

	var n1 = parseFloat(document.getElementById("lofrequld10").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld10").value = elem;
}

// for dcs1 hump 1
function cfCalculatorDCS1h1() {
	validateStartStopDCS1h1();
	calcDCS1CFULh1();
	calcDCS1CFDLh1();
	calcD1h1();
}

function validateStartStopDCS1h1() {
	var start = parseInt(document.getElementById("startchd11").value);
	var stop = parseInt(document.getElementById("stopchd11").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchd11").value = start;
	}
}

function calcDCS1CFULh1() {
	var start = parseInt(document.getElementById("startchd11").value);
	var stop = parseInt(document.getElementById("stopchd11").value);
	var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
	result = result.toFixed(1);
	document.getElementById("lofrequld11").value = result;
}
function calcDCS1CFDLh1() {

	var n1 = parseFloat(document.getElementById("lofrequld11").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld11").value = elem;
}

// for dcs1 hump 2
function cfCalculatorDCS1h2() {
	validateStartStopDCS1h2();
	calcDCS1CFULh2();
	calcDCS1CFDLh2();
	calcD1h2();
}

function validateStartStopDCS1h2() {
	var start = parseInt(document.getElementById("startchd12").value);
	var stop = parseInt(document.getElementById("stopchd12").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchd12").value = start;
	}
}

function calcDCS1CFULh2() {
	var start = parseInt(document.getElementById("startchd12").value);
	var stop = parseInt(document.getElementById("stopchd12").value);
	var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
	result = result.toFixed(1);
	document.getElementById("lofrequld12").value = result;
}
function calcDCS1CFDLh2() {

	var n1 = parseFloat(document.getElementById("lofrequld12").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld12").value = elem;
}

// for dcs1 hump 3
function cfCalculatorDCS1h3() {
	validateStartStopDCS1h3();
	calcDCS1CFULh3();
	calcDCS1CFDLh3();
	calcD1h3();
}

function validateStartStopDCS1h3() {
	var start = parseInt(document.getElementById("startchd13").value);
	var stop = parseInt(document.getElementById("stopchd13").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchd13").value = start;
	}
}

function calcDCS1CFULh3() {
	var start = parseInt(document.getElementById("startchd13").value);
	var stop = parseInt(document.getElementById("stopchd13").value);
	var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
	result = result.toFixed(1);
	document.getElementById("lofrequld13").value = result;
}
function calcDCS1CFDLh3() {

	var n1 = parseFloat(document.getElementById("lofrequld13").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld13").value = elem;
}

// for dcs1 hump 4
function cfCalculatorDCS1h4() {
	validateStartStopDCS1h4();
	calcDCS1CFULh4();
	calcDCS1CFDLh4();
	calcD1h4();
}

function validateStartStopDCS1h4() {
	var start = parseInt(document.getElementById("startchd14").value);
	var stop = parseInt(document.getElementById("stopchd14").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchd14").value = start;
	}
}

function calcDCS1CFULh4() {
	var start = parseInt(document.getElementById("startchd14").value);
	var stop = parseInt(document.getElementById("stopchd14").value);
	var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
	result = result.toFixed(1);
	document.getElementById("lofrequld14").value = result;
}
function calcDCS1CFDLh4() {

	var n1 = parseFloat(document.getElementById("lofrequld14").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld14").value = elem;
}

// for dcs2 hump 0
function cfCalculatorDCS2h0() {
	validateStartStopDCS2h0();
	calcDCS2CFULh0();
	calcDCS2CFDLh0();
	calcD2h0();
}

function calcDCS2CFULh0() {
	var start = parseInt(document.getElementById("startchd20").value);
	var stop = parseInt(document.getElementById("stopchd20").value);
	var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
	result = result.toFixed(1);
	document.getElementById("lofrequld20").value = result;
}
function calcDCS2CFDLh0() {

	var n1 = parseFloat(document.getElementById("lofrequld20").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld20").value = elem;
}

// for dcs2 hump 1
function cfCalculatorDCS2h1() {
	validateStartStopDCS2h1();
	calcDCS2CFULh1();
	calcDCS2CFDLh1();
	calcD2h1();
}

function validateStartStopDCS2h1() {
	var start = parseInt(document.getElementById("startchd21").value);
	var stop = parseInt(document.getElementById("stopchd21").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchd21").value = start;
	}
}

function calcDCS2CFULh1() {
	var start = parseInt(document.getElementById("startchd21").value);
	var stop = parseInt(document.getElementById("stopchd21").value);
	var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
	result = result.toFixed(1);
	document.getElementById("lofrequld21").value = result;
}
function calcDCS2CFDLh1() {

	var n1 = parseFloat(document.getElementById("lofrequld21").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld21").value = elem;
}

// for dcs2 hump 2
function cfCalculatorDCS2h2() {
	validateStartStopDCS2h2();
	calcDCS2CFULh2();
	calcDCS2CFDLh2();
	calcD2h2();
}

function validateStartStopDCS2h2() {
	var start = parseInt(document.getElementById("startchd22").value);
	var stop = parseInt(document.getElementById("stopchd22").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchd22").value = start;
	}
}

function calcDCS2CFULh2() {
	var start = parseInt(document.getElementById("startchd22").value);
	var stop = parseInt(document.getElementById("stopchd22").value);
	var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
	result = result.toFixed(1);
	document.getElementById("lofrequld22").value = result;
}
function calcDCS2CFDLh2() {

	var n1 = parseFloat(document.getElementById("lofrequld22").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld22").value = elem;
}

// for dcs2 hump 3
function cfCalculatorDCS2h3() {
	validateStartStopDCS2h3();
	calcDCS2CFULh3();
	calcDCS2CFDLh3();
	calcD2h3();
}

function validateStartStopDCS2h3() {
	var start = parseInt(document.getElementById("startchd23").value);
	var stop = parseInt(document.getElementById("stopchd23").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchd23").value = start;
	}
}

function calcDCS2CFULh3() {
	var start = parseInt(document.getElementById("startchd23").value);
	var stop = parseInt(document.getElementById("stopchd23").value);
	var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
	result = result.toFixed(1);
	document.getElementById("lofrequld23").value = result;
}
function calcDCS2CFDLh3() {

	var n1 = parseFloat(document.getElementById("lofrequld23").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld23").value = elem;
}

// for dcs2 hump 4
function cfCalculatorDCS2h4() {
	validateStartStopDCS2h4();
	calcDCS2CFULh4();
	calcDCS2CFDLh4();
	calcD2h4();
}

function validateStartStopDCS2h4() {
	var start = parseInt(document.getElementById("startchd24").value);
	var stop = parseInt(document.getElementById("stopchd24").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchd24").value = start;
	}
}

function calcDCS2CFULh4() {
	var start = parseInt(document.getElementById("startchd24").value);
	var stop = parseInt(document.getElementById("stopchd24").value);
	var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
	result = result.toFixed(1);
	document.getElementById("lofrequld24").value = result;
}
function calcDCS2CFDLh4() {

	var n1 = parseFloat(document.getElementById("lofrequld24").value);
	var y = 95.00;
	var elem = parseFloat(n1 + y);
	// elem = elem.toFixed(1);
	document.getElementById("lofreqdld24").value = elem;
}

// for umts hump 0
function cfCalculatorUMTSh0() {
	validateStartStopUMTSh0();
	calcUMTSCFDLh0();
	calcUMTSCFULh0();
	calcUh0();
}

function calcUMTSCFDLh0() {

	var start = parseInt(document.getElementById("startchu0").value);
	var result = parseFloat(start / 5);
	result = result.toFixed(1);
	document.getElementById("lofreqdlu0").value = result;
}

function calcUMTSCFULh0() {
	var result = parseFloat(document.getElementById("lofreqdlu0").value);
	var y = 190.00;
	result = parseFloat(result - y);
	result = result.toFixed(1);
	document.getElementById("lofrequlu0").value = result;

}

// for umts hump 1
function cfCalculatorUMTSh1() {
	validateStartStopUMTSh1();
	calcUMTSCFDLh1();
	calcUMTSCFULh1();
	calcUh1();
}

function validateStartStopUMTSh1() {
	var start = parseInt(document.getElementById("startchu1").value);
	var stop = parseInt(document.getElementById("stopchu1").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchu1").value = start;
	}
}

function calcUMTSCFULh1() {
	var result = parseFloat(document.getElementById("lofreqdlu1").value);
	result = result - 190.00;
	result = result.toFixed(1);
	document.getElementById("lofrequlu1").value = result;
}
function calcUMTSCFDLh1() {
	var start = parseInt(document.getElementById("startchu1").value);
	var stop = parseInt(document.getElementById("stopchu1").value);
	var result = parseFloat(start + (stop - start) / 2);
	result = (result / 5);
	result = result.toFixed(1);
	document.getElementById("lofreqdlu1").value = result;
}

// for umts hump 2
function cfCalculatorUMTSh2() {
	validateStartStopUMTSh2();
	calcUMTSCFDLh2();
	calcUMTSCFULh2();
	calcUh2();
}

function validateStartStopUMTSh2() {
	var start = parseInt(document.getElementById("startchu2").value);
	var stop = parseInt(document.getElementById("stopchu2").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchu2").value = start;
	}
}

function calcUMTSCFULh2() {
	var result = parseFloat(document.getElementById("lofreqdlu2").value);
	result = result - 190.00;
	result = result.toFixed(1);
	document.getElementById("lofrequlu2").value = result;
}
function calcUMTSCFDLh2() {
	var start = parseInt(document.getElementById("startchu2").value);
	var stop = parseInt(document.getElementById("stopchu2").value);
	var result = parseFloat(start + (stop - start) / 2);
	result = (result / 5);
	result = result.toFixed(1);
	document.getElementById("lofreqdlu2").value = result;
}

// for umts hump 3
function cfCalculatorUMTSh3() {
	validateStartStopUMTSh3();
	calcUMTSCFDLh3();
	calcUMTSCFULh3();
	calcUh3();
}

function validateStartStopUMTSh3() {
	var start = parseInt(document.getElementById("startchu3").value);
	var stop = parseInt(document.getElementById("stopchu3").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchu3").value = start;
	}
}

function calcUMTSCFULh3() {
	var result = parseFloat(document.getElementById("lofreqdlu3").value);
	result = result - 190.00;
	result = result.toFixed(1);
	document.getElementById("lofrequlu3").value = result;
}
function calcUMTSCFDLh3() {
	var start = parseInt(document.getElementById("startchu3").value);
	var stop = parseInt(document.getElementById("stopchu3").value);
	var result = parseFloat(start + (stop - start) / 2);
	result = (result / 5);
	result = result.toFixed(1);
	document.getElementById("lofreqdlu3").value = result;
}

// for umts hump 4
function cfCalculatorUMTSh4() {
	validateStartStopUMTSh4();
	calcUMTSCFDLh4();
	calcUMTSCFULh4();
	calcUh4();
}

function validateStartStopUMTSh4() {
	var start = parseInt(document.getElementById("startchu4").value);
	var stop = parseInt(document.getElementById("stopchu4").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startchu4").value = start;
	}
}

function calcUMTSCFULh4() {
	var result = parseFloat(document.getElementById("lofreqdlu4").value);
	result = result - 190.00;
	result = result.toFixed(1);
	document.getElementById("lofrequlu4").value = result;
}
function calcUMTSCFDLh4() {
	var start = parseInt(document.getElementById("startchu4").value);
	var stop = parseInt(document.getElementById("stopchu4").value);
	var result = parseFloat(start + (stop - start) / 2);
	result = (result / 5);
	result = result.toFixed(1);
	document.getElementById("lofreqdlu4").value = result;
}

function calcGh0() {

	var n1 = parseInt(document.getElementById('stopchg0').value);
	var n2 = parseInt(document.getElementById('startchg0').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwg0').value = result;
}

function calcD1h0() {

	var n1 = parseInt(document.getElementById('stopchd10').value);
	var n2 = parseInt(document.getElementById('startchd10').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwd10').value = result;
}

function calcD1h1() {

	var n1 = parseInt(document.getElementById('stopchd11').value);
	var n2 = parseInt(document.getElementById('startchd11').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwd11').value = result;
}

function calcD1h2() {

	var n1 = parseInt(document.getElementById('stopchd12').value);
	var n2 = parseInt(document.getElementById('startchd12').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwd12').value = result;
}

function calcD1h3() {

	var n1 = parseInt(document.getElementById('stopchd13').value);
	var n2 = parseInt(document.getElementById('startchd13').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwd13').value = result;
}

function calcD1h4() {

	var n1 = parseInt(document.getElementById('stopchd14').value);
	var n2 = parseInt(document.getElementById('startchd14').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwd14').value = result;
}

function calcD2h0() {

	var n1 = parseInt(document.getElementById('stopchd20').value);
	var n2 = parseInt(document.getElementById('startchd20').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwd20').value = result;
}

function calcD2h1() {

	var n1 = parseInt(document.getElementById('stopchd21').value);
	var n2 = parseInt(document.getElementById('startchd21').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	document.getElementById('bwd21').value = result;
}

function calcD2h2() {

	var n1 = parseInt(document.getElementById('stopchd22').value);
	var n2 = parseInt(document.getElementById('startchd22').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwd22').value = result;
}

function calcD2h3() {

	var n1 = parseInt(document.getElementById('stopchd23').value);
	var n2 = parseInt(document.getElementById('startchd23').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	document.getElementById('bwd23').value = result;
}

function calcD2h4() {

	var n1 = parseInt(document.getElementById('stopchd24').value);
	var n2 = parseInt(document.getElementById('startchd24').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwd24').value = result;
}

function calcUh0() {

	var n1 = parseInt(document.getElementById('stopchu0').value);
	var n2 = parseInt(document.getElementById('startchu0').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwu0').value = result;
}

function calcUh1() {

	var n1 = parseInt(document.getElementById('stopchu1').value);
	var n2 = parseInt(document.getElementById('startchu1').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwu1').value = result;
}

function calcUh2() {

	var n1 = parseInt(document.getElementById('stopchu2').value);
	var n2 = parseInt(document.getElementById('startchu2').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwu2').value = result;
}

function calcUh3() {

	var n1 = parseInt(document.getElementById('stopchu3').value);
	var n2 = parseInt(document.getElementById('startchu3').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwu3').value = result;
}

function calcUh4() {

	var n1 = parseInt(document.getElementById('stopchu4').value);
	var n2 = parseInt(document.getElementById('startchu4').value);
	var result = parseFloat((n1 - n2) * 0.2 + 0.2);
	result = result.toFixed(2);
	document.getElementById('bwu4').value = result;

}

function cfCalculator800h0() {
	validateStartStop800h0();
	calc800CFDLh0();
	calc800CFULh0();
	calc800h0();
}

function validateStartStop800h0() {
	var start = parseInt(document.getElementById("startch8_0").value);
	var stop = parseInt(document.getElementById("stopch8_0").value);
	if (stop != start) {
		stop = start;
		document.getElementById("stopch8_0").value = stop;
	}
}

function calc800CFDLh0() {
    var start = parseInt(document.getElementById("startch8_0").value);
	var stop = parseInt(document.getElementById("stopch8_0").value);
	var result = parseFloat(791 + [ ((start + stop) / 2) - 6150 ] * 0.1);
	result = result.toFixed(1);
	document.getElementById("lofreqdl8_0").value = result;
}

function calc800CFULh0() {
	var n1 = parseFloat(document.getElementById("lofreqdl8_0").value);
	var y = 41.00;
	var elem = parseFloat(n1 + y);
	document.getElementById("lofrequl8_0").value = elem;
}

function calc800h0() {
	var n1 = parseInt(document.getElementById('stopch8_0').value);
	var n2 = parseInt(document.getElementById('startch8_0').value);
	var result = parseFloat((n2 - n1 + 1) * 0.1);
	result = result.toFixed(2);
	document.getElementById('bw8_0').value = result;
}

function cfCalculator800h1() {
	validateStartStop800h1();
	calc800CFDLh1();
	calc800CFULh1();
	calc800h1();
}

function validateStartStop800h1() {

	var start = parseInt(document.getElementById("startch8_1").value);
	var stop = parseInt(document.getElementById("stopch8_1").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startch8_1").value = start;
	}
}

function calc800CFULh1() {
	var n1 = parseFloat(document.getElementById("lofreqdl8_1").value);
	var y = 41.00;
	var elem = parseFloat(n1 + y);
	document.getElementById("lofrequl8_1").value = elem;
}

function calc800CFDLh1() {
	
	var start = parseInt(document.getElementById("startch8_1").value);
	var stop = parseInt(document.getElementById("stopch8_1").value);
	var result = parseFloat(791 + [ ((start + stop) / 2) - 6150 ] * 0.1);
	result = result.toFixed(1);
	document.getElementById("lofreqdl8_1").value = result;

}

function calc800h1() {
	var n2 = parseInt(document.getElementById('stopch8_1').value);
	var n1 = parseInt(document.getElementById('startch8_1').value);
	var result = parseFloat((n2 - n1 + 1) * 0.1);
	result = result.toFixed(2);
	document.getElementById('bw8_1').value = result;
}

function cfCalculator800h2() {
	validateStartStop800h2();
	calc800CFDLh2();
	calc800CFULh2();
	calc800h2();
}

function validateStartStop800h2() {

	var start = parseInt(document.getElementById("startch8_2").value);
	var stop = parseInt(document.getElementById("stopch8_2").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startch8_2").value = start;
	}
}

function calc800CFULh2() {

	var n1 = parseFloat(document.getElementById("lofreqdl8_2").value);
	var y = 41.00;
	var elem = parseFloat(n1 + y);
	document.getElementById("lofrequl8_2").value = elem;
}

function calc800CFDLh2() {
	
	var start = parseInt(document.getElementById("startch8_2").value);
	var stop = parseInt(document.getElementById("stopch8_2").value);
	var result = parseFloat(791 + [ ((start + stop) / 2) - 6150 ] * 0.1);
	result = result.toFixed(1);
	document.getElementById("lofreqdl8_2").value = result;

}

function calc800h2() {
	var n2 = parseInt(document.getElementById('stopch8_2').value);
	var n1 = parseInt(document.getElementById('startch8_2').value);
	var result = parseFloat((n2 - n1 + 1) * 0.1);
	result = result.toFixed(2);
	document.getElementById('bw8_2').value = result;
}

function cfCalculator800h3() {
	validateStartStop800h3();
	calc800CFULh3();
	calc800CFDLh3();
	calc800h3();
}

function validateStartStop800h3() {

	var start = parseInt(document.getElementById("startch8_3").value);
	var stop = parseInt(document.getElementById("stopch8_3").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startch8_3").value = start;
	}
}

function calc800CFULh3() {

	var n1 = parseFloat(document.getElementById("lofreqdl8_3").value);
	var y = 41.00;
	var elem = parseFloat(n1 + y);
	document.getElementById("lofrequl8_3").value = elem;
}

function calc800CFDLh3() {
	
	var start = parseInt(document.getElementById("startch8_3").value);
	var stop = parseInt(document.getElementById("stopch8_3").value);
	var result = parseFloat(791 + [ ((start + stop) / 2) - 6150 ] * 0.1);
	result = result.toFixed(1);
	document.getElementById("lofreqdl8_3").value = result;

}

function calc800h3() {
	var n2 = parseInt(document.getElementById('stopch8_3').value);
	var n1 = parseInt(document.getElementById('startch8_3').value);
	var result = parseFloat((n2 - n1 + 1) * 0.1);
	result = result.toFixed(2);
	document.getElementById('bw8_3').value = result;
}

function cfCalculator800h4() {
	validateStartStop800h4();
	calc800CFULh4();
	calc800CFDLh4();
	calc800h4();
}

function validateStartStop800h4() {

	var start = parseInt(document.getElementById("startch8_4").value);
	var stop = parseInt(document.getElementById("stopch8_4").value);
	if (stop <= start) {
		start = stop;
		document.getElementById("startch8_4").value = start;
	}
}

function calc800CFULh4() {

	var n1 = parseFloat(document.getElementById("lofreqdl8_4").value);
	var y = 41.00;
	var elem = parseFloat(n1 + y);
	document.getElementById("lofrequl8_4").value = elem;
}

function calc800CFDLh4() {
	
	var start = parseInt(document.getElementById("startch8_4").value);
	var stop = parseInt(document.getElementById("stopch8_4").value);
	var result = parseFloat(791 + [ ((start + stop) / 2) - 6150 ] * 0.1);
	result = result.toFixed(1);
	document.getElementById("lofreqdl8_4").value = result;

}

function calc800h4() {
	var n2 = parseInt(document.getElementById('stopch8_4').value);
	var n1 = parseInt(document.getElementById('startch8_4').value);
	var result = parseFloat((n2 - n1 + 1) * 0.1);
	result = result.toFixed(2);
	document.getElementById('bw8_4').value = result;
}