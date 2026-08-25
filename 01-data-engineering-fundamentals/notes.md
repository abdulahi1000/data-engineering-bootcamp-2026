# Data Engineering Fundamentals

These notes document my understanding of the foundational ideas introduced at the start of the bootcamp.

## Operational vs Analytical Workloads

One idea that stood out to me is that a business should be able to ask questions about its data without making customers pay the price for it.

Operational databases are usually designed to support day-to-day application activity such as:

- customer logins
- transactions
- account updates
- order processing
- other real-time business operations

Analytical workloads can involve large scans, joins, aggregations, and repeated queries over historical data.

When heavy analytical queries compete with operational workloads for CPU, memory, I/O, or connections, application performance can be affected.

This is one reason organisations often separate systems used to **run the business** from systems used to **analyse the business**.

## What Clicked for Me

The quickest way to connect a dashboard to data is not always the architecture that will scale best as data volume, users, and reporting requirements grow.

## Connection to My Previous Experience

Having worked with dashboards and reporting, I have mostly interacted with data after it is already available for analysis. Learning data engineering is helping me think more carefully about what happens before that point: how data is extracted, stored, transformed, governed, and made available without disrupting operational systems.
