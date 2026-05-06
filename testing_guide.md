# Testing Guide - Campus Event Portal (Production-Ready OTP)

Follow these steps to verify the new Production-Ready Email OTP verification system.

## 1. Setup Environment
1.  **Gmail SMTP**: Update `application.properties` with:
    *   `spring.mail.username`: Your Gmail address.
    *   `spring.mail.password`: Your Gmail **App Password** (NOT your normal password).
2.  **Database**: Ensure MySQL is running and `schema.sql` is applied.
3.  **Start App**: Run the backend and frontend (use `scratch/start_all.ps1`).

## 2. Test Registration Flow
1.  **Signup**: Navigate to `/register`. Fill in details and submit.
2.  **Automatic OTP**: After submission, you should see the "Verify Email" step immediately.
3.  **Email Receipt**: Check your Gmail inbox for a professional HTML email from "Campus Event Portal".
4.  **UI Feedback**: Notice the loading indicators while the email is being sent.
5.  **OTP Entry**: Enter the 6-digit code. On success, you'll be redirected to Login.

## 3. Test Verification Blocking
1.  **Login Attempt**: Try logging in with a new account *without* verifying the OTP.
2.  **Redirect**: You should see an info message "Please verify your email first" and be **automatically redirected** to the `/verify-email` page.
3.  **Resend Logic**: On the `/verify-email` page, wait for the 60s timer to expire. Click "Resend Code" and verify a new email arrives.

## 4. Security & Polish
1.  **No Social Logins**: Confirm that "Continue with Google" is completely gone from both Login and Register pages.
2.  **Invalid OTP**: Enter an incorrect code and verify the error message appears.
3.  **Loading States**: Verify that all buttons show "Sending..." or "Verifying..." states during API calls to prevent double submissions.
4.  **Responsive Design**: Test the verification page on different screen sizes to ensure it looks premium everywhere.

## 5. Event Registration
1.  Log in and navigate to an event.
2.  Register and check your email for the **Confirmation HTML Email**.
