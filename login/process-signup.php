<?php
ob_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);

function showErrorAlert($message) {
    echo '
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "'.$message.'",
            customClass: {
                popup: "!rounded-xl"
            },
            confirmButtonText: "OK",
            background: "#ffffff",
            confirmButtonColor: "#3b82f6"
        }).then(() => {
            window.history.back();
        });
    </script>';
    die("Stopped at: showErrorAlert");
}

if (empty($_POST["fullName"])) showErrorAlert("Full name is required");
if (empty($_POST["sex"])) showErrorAlert("Gender is required");
if (empty($_POST["wano"])) showErrorAlert("Whatsapp number is required");
if (empty($_POST["nic"])) showErrorAlert("NIC number is required");
if (empty($_POST["memType"])) showErrorAlert("Member type is required");
if (empty($_POST["university"])) showErrorAlert("University is required");
if (empty($_POST["course"])) showErrorAlert("Course is required");
if (empty($_POST["examYear"])) showErrorAlert("Exam year is required");
if (empty($_POST["shy"])) showErrorAlert("Exam chance is required");
if (empty($_POST["dob"])) showErrorAlert("Date of birth is required");
if (empty($_POST["name"])) showErrorAlert("Name is required");
if (empty($_POST["designation"])) showErrorAlert("Designation is required");
if (empty($_POST["terms"])) showErrorAlert("You must agree to the terms and conditions.");
// Enforce exactly 10 digits for WhatsApp
if (!preg_match("/^[0-9]{10}$/", $_POST["wano"])) {
    showErrorAlert("WhatsApp number must be exactly 10 digits.");
}

// Enforce valid Sri Lankan NIC (Old: 9 digits + V/X, New: 12 digits)
if (!preg_match("/^([0-9]{12}|[0-9]{9}[vVxX])$/i", $_POST["nic"])) {
    showErrorAlert("Please enter a valid NIC (e.g., 200432700899 or 991234567V).");
}

if (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
    showErrorAlert("Valid email is required");
}

if (strlen($_POST["password"]) < 8) {
    showErrorAlert("Password must be at least 8 characters");
}

if (!preg_match("/[a-z]/i", $_POST["password"])) {
    showErrorAlert("Password must contain at least one letter");
}

if (!preg_match("/[0-9]/", $_POST["password"])) {
    showErrorAlert("Password must contain at least one number");
}

if ($_POST["password"] !== $_POST["password_confirmation"]) {
    showErrorAlert("Passwords must match");
}

$password_hash = password_hash($_POST["password"], PASSWORD_DEFAULT);
$activation_token = bin2hex(random_bytes(16));
$activation_token_hash = hash("sha256", $activation_token);

$mysqli = @require __DIR__ . "/database.php";

// Check for existing email or NIC
$sql_check = "SELECT id FROM user WHERE email = ? OR nic = ?";
$stmt_check = $mysqli->prepare($sql_check);

$stmt_check->bind_param("ss", $_POST["email"], $_POST["nic"]);
$stmt_check->execute();
$stmt_check->store_result();

if ($stmt_check->num_rows > 0) {
    showErrorAlert("Email or NIC already exists");
}
$stmt_check->close();

// --- NEW CUSTOM ID GENERATION LOGIC (EM + YY + xxxx) ---

// Extract the last 2 digits of the exam year (e.g., "2024" becomes "24", "2017" becomes "17")
$shortYear = substr($_POST["examYear"], -2); 

$prefix = "EM" . $shortYear; // e.g., EM17

// 1. Find the highest existing ID number for THIS specific short year
// We use LIKE to search for any ID that starts with "EM17"
$sql_latest = "SELECT member_id FROM user WHERE member_id LIKE ? ORDER BY id DESC LIMIT 1";
$stmt_latest = $mysqli->prepare($sql_latest);
$search_prefix = $prefix . "%"; 
$stmt_latest->bind_param("s", $search_prefix);
$stmt_latest->execute();
$stmt_latest->bind_result($last_member_id);
$stmt_latest->fetch();
$stmt_latest->close();

$next_number = 1; // Default starting number

if ($last_member_id) {
    // 2. Strip away the "EM17" part, leaving just the numeric "0001"
    $number_part = str_replace($prefix, '', $last_member_id);
    $next_number = intval($number_part) + 1;
}

// 3. Format the new ID (Prefix + 4 padded digits: EM170001)
$custom_member_id = $prefix . str_pad($next_number, 3, "0", STR_PAD_LEFT);

// --- END CUSTOM ID LOGIC ---

// Added member_id to the INSERT statement and added an extra "?"
$sql = "INSERT INTO user (member_id, name, fullName, sex, wano, address, designation, nic, memType, university, course, examYear, dob, email, password_hash, account_activation_hash)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $mysqli->stmt_init();
if (!$stmt->prepare($sql)) {
   die("SQL error: " . $mysqli->error);
}

// Added the $custom_member_id to the binding and an extra "s" to the type definition string
$stmt->bind_param("ssssssssssssssss",
    $custom_member_id,
    $_POST["name"],
    $_POST["fullName"],
    $_POST["sex"],
    $_POST["wano"],
    $_POST["address"],
    $_POST["designation"],
    $_POST["nic"],
    $_POST["memType"],
    $_POST["university"],
    $_POST["course"],
    $_POST["examYear"],
    $_POST["dob"],
    $_POST["email"],
    $password_hash,
    $activation_token_hash
);


if ($stmt->execute()) {
    $mail = @require __DIR__ . "/mailer.php";
    if (!$mail) die("Mailer load failed");

    $mail->setFrom("eiawebpage@gmail.com", "Education Incentive Association");
    $mail->addAddress($_POST["email"]);
    $mail->Subject = "Activate Your Account";

    $activation_url = "http://eia.lk/login/activate-account.php?token=$activation_token";

    $mail->isHTML(true);
$mail->Body = <<<END
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Activation</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-blue-50 font-sans">
    <div class="max-w-2xl mx-auto my-8 bg-white rounded-xl shadow-md overflow-hidden">
        <div class="bg-blue-600 p-6 text-white">
            <h1 class="text-2xl font-bold">Welcome to Education Incentive Association</h1>
            <p class="opacity-90">Please activate your account</p>
        </div>
        
        <div class="p-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Dear {$_POST['name']},</h2>
            <p class="text-gray-600 mb-6">
                Thank you for registering with Education Incentive Association. Your assigned Member ID is <strong>$custom_member_id</strong>.
                Please click the button below to activate your account and complete your registration.
            </p>
            
            <div class="text-center mb-6">
                <a href="$activation_url" class="inline-block px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg shadow-sm transition duration-200">
                    Activate Your Account
                </a>
            </div>
            
            <p class="text-gray-500 text-sm mb-4">
                If the button above doesn't work, copy and paste this link into your browser:
            </p>
            <p class="text-blue-500 text-sm break-all bg-blue-50 p-3 rounded">
                $activation_url
            </p>
            
            <div class="mt-8 pt-6 border-t border-gray-200">
                <p class="text-gray-500 text-sm">
                    If you didn't request this email, you can safely ignore it.
                </p>
                <p class="text-gray-500 text-sm mt-2">
                    This is a server generated email. Please DO NOT reply back for queries here.<br/>
                    For Website queries and bug reports, please contact joashjeshurun9@protonmail.ch<br/>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
END;

    $mail->AltBody = "Please activate your account by visiting this URL: $activation_url. Your Member ID is $custom_member_id.";

    try {
        $mail->send();
        header("Location: signup-success.php");
        exit;
    } catch (Exception $e) {
        die("Mail failed: " . $mail->ErrorInfo);
    }

} else {
    die("Insert failed: " . $mysqli->error);
}
ob_end_flush();
?>