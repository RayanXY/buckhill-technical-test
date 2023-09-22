# CASE 4

There seems to be a typo in the email template, but we should verify other possibilities for this error.

### Check the email template

Let's verify the email template and check if there is indeed a typo in the placeholder and change it to "{amount_fee}" instead of "{amunt_fee}". Let's also ensure that the placeholder uses the right amount of brackets, like `{{amount_fee}}` or `{{{amount_fee}}}`. I could make the change or direct it as a simple task for the Frontend Team to do it.

### Check the backend logic

Let's also double-check if the backend is populating the variable correctly, so we can ensure the naming is right on both ends.

### Tests

We should create some test emails to verify if working properly and showing the amount due and also test with this specific client data.

### Contact with the client

I would reach out to the client once the issue is resolved to confirm that they are receiving the "Amount Due" email with the accurate wording and the correct amount to pay.
