pos = 0;
function go_left() {
    if (pos > -400) {
        pos = pos - 0.15;
        slider.style.left = pos + "%";
    }
    if (pos < -399) {
        intervals(0);
        pos = -400;
        slider.style.left = "-400%";
        intervals(2);
    }
}

function go_right() {
    if (pos < 0) {
        pos = pos + 0.15;
        slider.style.left = pos + "%";
    }
    if (pos > -1) {
        intervals(0);
        pos = 0;
        slider.style.left = "0%";
        intervals(1);
    }
}

intervals(1);

var interval = setInterval();
function intervals(x) {
    if (x == 1) {
        interval = setInterval("go_left()", 35);
    }
    else if (x == 2) {
        interval = setInterval("go_right()", 35);
    }
    else if (x == 0) {
        clearInterval(interval);
    }
}


function keyToLoggin() {
    form1.style.display = "none";
    form2.style.display = "block";
}

function keyToReg() {
    form2.style.display = "none";
    form1.style.display = "block";
}
    
