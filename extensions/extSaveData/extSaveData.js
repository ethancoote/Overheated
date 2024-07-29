function set_best_time(mins, sec) {
    localStorage.setItem("bestMins", mins);
    localStorage.setItem("bestSec", sec)
}

function get_best_time_mins() {
    mins = localStorage.getItem("bestMins");
    if (mins == null) {
        return "";
    } else {
        return mins;
    }
    
}

function get_best_time_sec() {
    sec = localStorage.getItem("bestSec");
    if (sec == null) {
        return "";
    } else {
        return sec;
    }
    
}