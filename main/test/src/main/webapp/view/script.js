document.addEventListener("DOMContentLoaded", function () {
    function setCookie(name, value, days) {
        let expires = "";
        if (days) {
            let date = new Date();
            date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
            expires = "; expires=" + date.toUTCString();
        }
        document.cookie = name + "=" + value + "; path=/" + expires;
    }

    function getCookie(name) {
        let cookieArr = document.cookie.split(";");
        for (let i = 0; i < cookieArr.length; i++) {
            let cookiePair = cookieArr[i].split("=");
            if (name === cookiePair[0].trim()) {
                return cookiePair[1];
            }
        }
        return null;
    }

    // Show cookie banner if coming from signup or login page
    if (document.referrer.includes("Signup.jsp") || document.referrer.includes("home.jsp")) {
        if (!getCookie("cookiesAccepted")) {
            document.getElementById("cookie-banner").style.display = "block";
        }
    }

    document.getElementById("accept-cookies").addEventListener("click", function () {
        setCookie("cookiesAccepted", "true", 365);
        document.getElementById("cookie-banner").style.display = "none";
    });
});
