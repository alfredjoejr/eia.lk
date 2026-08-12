<?php
$email = $_POST["email"] ?? "";

if (empty($email)) {
    http_response_code(400);
    echo "Email is required";
    exit;
}

$token = bin2hex(random_bytes(16));
$token_hash = hash("sha256", $token);
$expiry = date("Y-m-d H:i:s", time() + 60 * 30);

$mysqli = require __DIR__ . "/database.php";

$sql = "UPDATE user
        SET reset_token_hash = ?,
            reset_token_expires_at = ?
        WHERE email = ?";

$stmt = $mysqli->prepare($sql);
$stmt->bind_param("sss", $token_hash, $expiry, $email);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    $mail = require __DIR__ . "/mailer.php";

    $mail->setFrom("noreply@eia.lk", "Education Incentive Association");
    $mail->addAddress($email);
    $mail->Subject = "Password Reset | EIA";
    
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
    $host = $_SERVER['HTTP_HOST'];
    $resetLink = $protocol . $host . "/login/reset-password.php?token=" . $token;

    $mail->isHTML(true);
    $mail->Body = <<<END
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset</title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');
        body { font-family: 'Inter', sans-serif; background-color: #f8fafc; }
        .card { max-width: 480px; border-radius: 12px; }
        .btn-primary { background-color: #3b82f6; }
        .btn-primary:hover { background-color: #2563eb; }
    </style>
</head>
<body class="bg-gray-50">
    <div class="max-w-2xl mx-auto p-4">
        <div class="bg-white card shadow-sm border border-gray-200 p-6 sm:p-8">
            <div class="flex justify-center mb-6">
                <div class="w-12 h-12 rounded-full bg-blue-50 flex items-center justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-blue-500">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                    </svg>
                </div>
            </div>
            
            <h2 class="text-2xl font-bold text-center text-gray-900 mb-2">Reset Your Password</h2>
            <p class="text-gray-600 text-center mb-6">We received a request to reset your password. Click the button below to choose a new password.</p>
            
            <div class="text-center mb-6">
                <a href="$resetLink" class="btn-primary inline-flex items-center justify-center rounded-md px-6 py-3 text-white font-medium transition-colors hover:shadow-md" style="text-decoration: none; color: white;">
                    Reset Password
                </a>
            </div>
            
            <p class="text-gray-500 text-sm text-center mb-0">If you didn't request this, please ignore this email. Your password will remain unchanged.</p>
            
            <div class="border-t border-gray-200 mt-6 pt-6 text-center">
                <p class="text-gray-500 text-sm">Need help? <a href="mailto:support@eia.lk" class="text-blue-600 hover:underline">Contact our support team</a></p>
            </div>
        </div>
        
        <div class="mt-4 text-center text-gray-500 text-xs">
            <p>© 2024 EIA. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
END;

    $mail->AltBody = "Click this link to reset your password: " . $resetLink;

    try {
        $mail->send();
    } catch (Exception $e) {
        http_response_code(500);
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        exit;
    }
}

// Always return a success response to avoid email enumeration
http_response_code(200);
echo "Success";
?>