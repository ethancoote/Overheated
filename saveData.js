function set_best_time(mins, sec) {
    localStorage.setItem("bestMins", mins);
    localStorage.setItem("bestSec", sec)
}

function get_best_time_mins() {
    mins = localStorage.getItem("bestMins");

    return sec;
}

function get_best_time_sec() {
    console.log("hello");
    sec = localStorage.getItem("bestSec");

    return sec;
}