function fn() {
	// ******First Name*******
	var a = document.getElementById("fn");
	var a1 = document.getElementById("sfn1");
	var a2 = document.getElementById("sfn2");

	if (a.value == "") {
		a.style.border = "1px solid red";
		a1.style.display = "";
	} else if (a.value.length < 3) {
		a.style.border = "1px solid red";
		a1.style.display = "none";
		a2.style.display = "";
	}

	else {
		a.style = "display none";
		a1.style.display = "none";
		a2.style.display = "none";
	}

	// ******Last Name*******
	var b = document.getElementById("ln");
	var b1 = document.getElementById("sln1");
	var b2 = document.getElementById("sln2");

	if (b.value == "") {
		b.style.border = "1px solid red";
		b1.style.display = "";
	} else if (b.value.length < 3) {
		b.style.border = "1px solid red";
		b1.style.display = "none";
		b2.style.display = "";
	}

	else {
		b.style = "display none";
		b1.style.display = "none";
		b2.style.display = "none";
	}

	// ******User Name*******
	var c = document.getElementById("un");
	var c1 = document.getElementById("sun1");
	var c2 = document.getElementById("sun2");

	if (c.value == "") {
		c.style.border = "1px solid red";
		c1.style.display = "";
	} else if (c.value.length < 3) {
		c.style.border = "1px solid red";
		c1.style.display = "none";
		c2.style.display = "";
	}

	else {
		c.style = "display none";
		c1.style.display = "none";
		c2.style.display = "none";
	}

	// ******Email*******
	var d = document.getElementById("em");
	var d1 = document.getElementById("sem1");
	var d2 = document.getElementById("sem2");
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

	if (d.value == "") {
		d.style.border = "1px solid red";
		d1.style.display = "";
	} else if (!filter.test(d.value)) {
		d.style.border = "1px solid red";
		d1.style.display = "none";
		d2.style.display = "";
	}

	else {
		d.style = "display none";
		d1.style.display = "none";
		d2.style.display = "none";
	}

	// ******Phone Number*******
	var e = document.getElementById("phon");
	var e1 = document.getElementById("spn1");
	var e2 = document.getElementById("spn2");

	if (e.value == "") {
		e.style.border = "1px solid red";
		e1.style.display = "";
	} else if (e.value.length < 10) {
		e.style.border = "1px solid red";
		e1.style.display = "none";
		e2.style.display = "";
	} else {
		e.style = "display none";
		e1.style.display = "none";
		e2.style.display = "none";
	}

	// ******Birth Date*******
	var g = document.getElementById("dob");
	var g1 = document.getElementById("sdob");

	if (g.value == "") {
		g.style.border = "1px solid red";
		g1.style.display = "";
	} else {
		g.style = "display none";
		g1.style.display = "none";
	}

	// ******Password*******
	var h = document.getElementById("pwd");
	var h1 = document.getElementById("spwd1");
	var h2 = document.getElementById("spwd2");

	if (h.value == "") {
		h.style.border = "1px solid red";
		h1.style.display = "";
	} else if (h.value.length < 8) {
		h.style.border = "1px solid red";
		h1.style.display = "none";
		h2.style.display = "";
	} else {
		h.style = "display none";
		h1.style.display = "none";
		h2.style.display = "none";
	}

	// ******Confirm Password*******
	var k = document.getElementById("conpwd");
	var k1 = document.getElementById("sconpwd1");
	var k2 = document.getElementById("sconpwd2");

	if (k.value == "") {
		k.style.border = "1px solid red";
		k1.style.display = "";
	} else if (k.value != h.value) {
		k.style.border = "1px solid red";
		k1.style.display = "none";
		k2.style.display = "";
	} else {
		k.style = "display none";
		k1.style.display = "none";
		k2.style.display = "none";
	}
}