# Design Document

By Aybike Cetinus

Video overview: <https://youtu.be/7rVnU-K3mzs>

## Scope

In this section you should answer the following questions:

* Our purpose of this database is find out the which artist is popular in which city and also if an event organizer decided to create a concert in a city which is artist is popular, what will be the profit from this organization. Additionally, with this database an event organizer can follow up the tickets that are sold, the quantitiy and the orders for an event.

The things that are included in the database's scope:

* Cities and the venues that are in that city
* Events, each held at one venue with start and end datetime, and venue_rental_fee to be paid in order to held the event
* Artist, which artist perform at which event along with the fee the organizer pays each one (event_artist)
* Customers, people who buy the tickets
* Ticket sales:
    ticket categories and price for each event (ticket_types)
    customer orders for an event (order)
    tickets which shows the seat number and checked in flag for individual tickets
* Popularity data, listener counts for each artist in each city so that organizer can see which artist are populer where and choose venue according to that
* Financial analysis, find out the profit by substracing total revenue got by tickets that sold, from total cost which is add up the venue rent and artist fee

Staff and crew data, payment details, other expences such as marketing, taxes, etc. are excluded from our database

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?
    A user can store venues, cities, artist, events and each event's performer artists and their fees.
    A user can see how many tickets have been sold and how many are still available
    A user can calculate each event's cost and their profit
    And also can see the artist popularity by city over time and using that for choosing the right venue for a new event

* What's beyond the scope of what a user should be able to do with your database?
    Managing staff and crew. Process real peayments or store credit card details.
    Collect reviews for the event from customers.

## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

In this section you should answer the following questions:

The "cities" table includes:

* "id", which specifies the unique ID for the city as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
* "name" , which is the name of the city as TEXT. This column has the NOT NULL and UNIQUE constraints applied, so each city is stored only once.

The "venues" table includes:

* "id", which specifies the unique ID for the venue as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
* "name", which is the name of the venue as TEXT.
* "city_id", which is the ID of the city where the venue is located as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the cities table.
* "district", which is the district of the venue as TEXT.
* "address", which is the street address of the venue as TEXT.
* "capacity", which is the maximum number of attendees the venue can hold as an INTEGER. A CHECK constraint ensures it is greater than 0.
All columns in this table are NOT NULL.

The "artists" table includes:

* "id," which specifies the unique ID for the artist as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
* "name", which is the name of the artist or band as TEXT. This column has the UNIQUE constraint applied so the same artist is not stored twice.
* "genre", which is the music genre of the artist as TEXT. It is optional, so it can be NULL.

The "events" table includes:

* "id", which specifies the unique ID for the event as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
* "event_name", which is the name of the concert event as TEXT.
* "venue_id", which is the ID of the venue where the event takes place as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the venues table. Each event has exactly one venue.
* "venue_rental_fee", which is the rent paid to the venue for this event, in Turkish lira, as a REAL. The rent is stored here rather than in venues because it can differ from event to event. A CHECK constraint ensures it is not negative.
* "start_datetime", which is the start date and time of the event as NUMERIC.
* "end_datetime", which is the end date and time of the event as NUMERIC.
* "status", which is the current status of the event (such as planned, on sale, or cancelled) as TEXT.

The "customers" table includes:

* "id", which specifies the unique ID for the customer as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
* "first_name", which is the customer’s first name as TEXT.
* "last_name", which is the customer’s last name as TEXT.
* "email", which is the customer’s email address as TEXT. This column has the UNIQUE constraint applied so each email belongs to only one customer.
* "phone", which is the customer’s phone number as TEXT. It is optional, and stored as text so the +90 prefix and leading zeros are preserved.

The "ticket_types" table includes:

* "id", which specifies the unique ID for the ticket type as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
* "event_id", which is the ID of the event this ticket type is sold for as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the events table.
* "ticket_type", which is the category of the ticket as TEXT. A CHECK constraint restricts it to 'VIP', 'General', or 'Early Bird'.
* "price", which is the price of one ticket of this type, in Turkish lira, as a REAL. A CHECK constraint ensures it is not negative.
* "quantity_available", which is the number of tickets of this type put on sale as an INTEGER. A CHECK constraint ensures it is greater than 0.

The "orders" table includes:

* "id", which specifies the unique ID for the order as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
* "event_id", which is the ID of the event the order is for as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the events table. Each order is for exactly one event.
* "customer_id", which is the ID of the customer who placed the order as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the customers table.
* "order_datetime", which is the date and time the order was placed as NUMERIC. It defaults to CURRENT_TIMESTAMP.
* "total_amount", which is the total price of the order, in Turkish lira, as a REAL. A CHECK constraint ensures it is not negative.
* "payment_status", which is the payment state of the order as TEXT. A CHECK constraint restricts it to 'pending', 'paid', 'refunded', or 'fail'. Only 'paid' orders count as revenue.

The "tickets" table includes:

* "id", which specifies the unique ID for the individual ticket as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
* "order_id", which is the ID of the order the ticket belongs to as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the orders table.
* "ticket_type_id", which is the ID of the ticket type (VIP, General, or Early Bird) as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the ticket_types table.
* "seat_number", which is the seat assigned to the ticket as TEXT. It is optional, since standing tickets have no seat.
* "checked_in", which specifies whether the ticket has been scanned at the entrance as an INTEGER, where 1 means checked in and 0 means not. It defaults to 0, and a CHECK constraint restricts it to those two values.

The "artist_popularity" table includes:

* "id", which specifies the unique ID for the popularity record as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
* "artist_id", which is the ID of the artist as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the artists table.
* "city_id", which is the ID of the city where the popularity was measured as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the cities table.
* "period_start", which is the first day of the month the measurement covers as NUMERIC. Storing one row per month makes it possible to analyze popularity over time.
* "monthly_listeners", which is the number of monthly listeners of the artist in that city and month as an INTEGER.

The "event_artists" table includes:

* "id", which specifies the unique ID for the lineup entry as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
* "artist_event_id", which is the ID of the event the artist performs at as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the events table.
* "artist_id", which is the ID of the performing artist as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the artists table.
* "fee", which is the amount paid to the artist for performing at the event, in Turkish lira, as a REAL. A CHECK constraint ensures it is not negative.

### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

![ER Diagram](concert_er_diagram.png)

## Optimizations
"event_sales_summary", view shows for each event how many tickets are available
"artist_costs", speed up the process to find out the total artist fees for each event
"order_revenue", speed up the process to find out the revenue for each event
"event_financials", speed up the process to find out the profit for each event

"event_date_location", speed up the most common event lookups
"ticket_checked", speed up the process to look up only checked tickets (which means used for enter the event)

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
    Because I didn't involve tax or other expences, the total cost and accordint ot that the profit is partly accurate.
    Right now nothing is stops overselling since I don't have any constraints for checking the quantity_available for an event.

* What might your database not be able to represent very well?
    An order contains tickets for more than one event, right now each order has a single event_id
    I have a payment status for 'refund2 but the process is not in detail
    Transferin ticket is also a missing point in my database

