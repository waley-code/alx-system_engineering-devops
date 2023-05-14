# My first postmortem
### Issue Summary:
On May 10th, 2023, from 1:00 PM to 2:30 PM EST, users of our online shopping platform experienced significant slowdowns and intermittent errors. Approximately 70% of users were affected. The root cause was traced to an unexpected surge in traffic to our platform, overwhelming our server infrastructure.

### Timeline:

- 1:00 PM — Our monitoring system alerted us to a spike in traffic to our platform.

- 1:05 PM — We investigated our server infrastructure and found that our servers were struggling to keep up with the traffic.

- 1:15 PM — We began scaling up our server infrastructure to handle the increased traffic.

- 1:30 PM — We noticed that the additional server capacity did not resolve the issue and the system was still experiencing intermittent errors.

- 1:45 PM — We started investigating the possibility of a software issue, which led us down a few misleading paths.

- 2:00 PM — We escalated the incident to our senior engineering team.

- 2:15 PM — Our engineering team discovered that a surge in traffic to our platform had overwhelmed our server infrastructure and caused the slowdowns and errors.

- 2:30 PM — We implemented temporary measures to stabilize the platform, which restored the service to normal operation.

### Root Cause and Resolution:

The root cause of the outage was an unexpected surge in traffic to our platform. Our server infrastructure was not able to handle the increased load, which caused the platform to slow down and become unresponsive. To resolve the issue, we immediately scaled up our server infrastructure and added additional capacity. However, this did not fully resolve the issue, and we then discovered that the root cause was a surge in traffic that had overwhelmed our server infrastructure. Our senior engineering team implemented temporary measures to stabilize the platform and reduce the impact on users.

### Corrective and Preventative Measures:

To prevent similar issues in the future, we will be implementing the following measures:

- Improve our server infrastructure’s scalability to handle sudden traffic surges.
- Implement more advanced traffic monitoring to detect sudden spikes in traffic.
- Automate the process of scaling up server infrastructure to handle increased traffic.
- Create a more resilient architecture that can handle sudden traffic surges without causing significant impact on users.
- Conduct a thorough review of our monitoring and alerting systems to ensure that we are able to quickly detect and respond to any issues that may arise.

In conclusion, we deeply apologize for the inconvenience caused to our users during this outage. We are taking all necessary steps to prevent similar issues from occurring in the future. Our team is committed to ensuring that our platform remains available, reliable, and performant for our users.
