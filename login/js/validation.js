const validation = new JustValidate("#signup");

validation
    .addField("#name", [
        {
            rule: "required"
        }
    ])
    .addField("#wano", [
        {
            rule: "required",
            errorMessage: "WhatsApp number is required"
        },
        {
            rule: "customRegexp",
            value: /^[0-9]{10}$/,
            errorMessage: "WhatsApp number must be exactly 10 digits"
        }
    ])
    .addField("#nic", [
        {
            rule: "required",
            errorMessage: "NIC is required"
        },
        {
            rule: "customRegexp",
            value: /^([0-9]{12}|[0-9]{9}[vVxX])$/i,
            errorMessage: "Please enter a valid NIC (e.g., 2004xxxxxxxx or 991234567V)"
        }
    ])
    .addField("#email", [
        {
            rule: "required"
        },
        {
            rule: "email"
        },
        {
            validator: (value) => () => {
                return fetch("validate-email.php?email=" + encodeURIComponent(value))
                        .then(function(response) {
                            return response.json();
                        })
                        .then(function(json) {
                            return json.available;
                        });
            },
            errorMessage: "email already taken"
        }
    ])
    .addField("#password", [
        {
            rule: "required"
        },
        {
            rule: "password"
        }
    ])
    .addField("#password_confirmation", [
        {
            validator: (value, fields) => {
                return value === fields["#password"].elem.value;
            },
            errorMessage: "Passwords should match"
        }
    ])
    // --- THIS IS THE NEW CODE ---
    .addField("#terms", [
        {
            rule: "required",
            errorMessage: "You must agree to the terms and conditions"
        }
    ])
    // ----------------------------
    .onSuccess((event) => {
        document.getElementById("signup").submit();
    });