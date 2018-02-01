function check_pass() {
    if (document.getElementById('password').value ==
        document.getElementById('password_confirm').value) {
        document.getElementById('submit').disabled = false;
    } else {
        document.getElementById('submit').disabled = true;
        document.getElementById('message').innerText = "not matching";
    }
}