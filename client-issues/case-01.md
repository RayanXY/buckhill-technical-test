# CASE 1

There could be a lot of reasons for this strange behavior, so I would start from the bottom and escalate until I reach the cause. I would use debugging tools to trace the entire process and log relevant information so we can have documentation about this issue.

### Check the final price code

Let's first examine the logic/code behind the calculation for the final price, looking for bugs/errors that could cause the wrong price, this way we can pinpoint whether is a backend or a frontend problem.

##### Check the backend

Let's verify how the prices of the products are being retrieved and calculated. This way, we can ensure if the prices we are fetching are correct.

##### Check the frontend

We need to verify the code responsible for showing the final price to the clients. This way, we can ensure that the logic behind the price is correct or that any formatting we are doing can be the cause of the wrong price.

### Tests with other products

We also need to test with other items, different quantities, and combinations, so we may be able to identify if the problem occurs in a specific scenario or if it's consistent throughout the platform.

### Fix the issue

After all the testing, debugging, and finally finding the source of the issue, we need to make the corrections, contact the backend or frontend team, and show our findings and possible solutions to ensure the issue will be resolved and the correct final price is displayed for the clients.

### QA

Following the correction, we need the QA Team to validate the application thoroughly to ensure that the issue is solved.

### Contact with the client

Finally, I would reach out to the client, informing them of the issue resolution, apologize for any inconvenience caused, and confirm that they can now proceed with their purchase.
