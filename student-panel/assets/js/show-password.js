
"use strict"
function createpassword(inputId, button) {
    const input = document.getElementById(inputId);
    if (input.type === "password") {
        input.type = "text";
        button.innerHTML = '<i class="ri-eye-line align-middle"></i>';
    } else {
        input.type = "password";
        button.innerHTML = '<i class="ri-eye-off-line align-middle"></i>';
    }
}