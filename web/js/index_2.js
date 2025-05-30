window.onload = function() {
    var p = document.getElementById("password_field");

    p.onfocus = function() {
        document.querySelector(".img_holder").className += " password";
    }

    p.onblur = function() {
        document.querySelector(".password").className = "img_holder";
    }

    document.querySelector("body").className = "";
}