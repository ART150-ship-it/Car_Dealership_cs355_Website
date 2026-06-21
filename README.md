# Car_Dealership_cs355

CS-355 Project Proposal Documentation
Group Information
Group Name: Group 5
Class Section: [CS-355-001]
Group Members
Name
Email
[Arturo Nunez Gomez]
[nunezgomea@sonoma.edu]
[Homero Arellano]
[arellanome@sonoma.edu]
[Tadhg Cahill]
[cahillt@sonoma.edu]
[Emilio Orozco]
[orozcoem@sonoma.edu]

1. Application Description
Provide a clear and concise description of your database and the problem your database will solve. Explain the purpose of the database, how it will be used, and the context in which it will operate. Be sure to articulate the real-world or hypothetical scenario your database addresses.
Our database aims to create a tool that would be utilized by a car dealership. The creation of this database would allow the end-users(people running a car dealership and customers themselves based on their ‘read permissions’) to retrieve valued information with ease and with views that are readable. The database takes into account sales, finance, and service departments, as well as employees and customers. 
2. Requirements Analysis
Describe the core functionalities, such as the key products or services, user roles, and main processes (for example sales, product requests, deliveries). Focus on what the database will achieve rather than how it will be implemented.
Our database will serve a used car dealership's needs, with the core focus being tracking and managing vehicles. 

This primarily pertains to inventory tracking to streamline the buying and selling of vehicles. 

this inventory management will track the vehicles make, model, year, color, trim, mileage, if it is preowned, any damages, and if it is ready to be purchased

The dealership's user’s fall into two categories: customers and employees, who alike may search the database for vehicles by filtering by price, make, size, price, mileage, and age to name a few

employees will manage vehicles by manipulating sales, purchases, rentals, leases, and trade-ins directly in the database. 

The database will also retain records on employees and customers accounts. this will include the employee’s department, pay type, amount and tenure. the information on customers will include, previous purchases, name, phone number, id, and credit score

if damage, previous ownership, among other attributes are left null, then that means it is not applicable (or none).
3. Example Queries (Questions)
List 3-4 examples of the queries you intend to implement in your database. Describe these queries in plain English, specifying the purpose of each query and the type of information it will retrieve or manipulate.
Example Format:
- Query 1: [all vehicles currently ready to purchase, with a year after 1999 and selling for less than $10,000]
- Query 2: [A query that retrieves information of customers and vehicles they have purchased from that dealership. This will be useful for salespeople to contact them regarding trade-ins/upgrades or for service to contact them about their maintenance.]
- Query 3: [A query that can retrieve information about the sales department’s workers and cars sold. This would be useful for commission information.]
-Query 4: [A query that will update the status of a vehicle. This allows the dealership to  view/update if a vehicle is sold, financed/leased, in transit, or available]
4. Preliminary Data Model
Describe the entities, their attributes, and the relationships between them.
entities: Employee, Department, Vehicle, Customer
relations: works for (employee to department), purchased ( customer to vehicle), leasing/financing ( customer to vehicle), sold (employee to vehicle (for commission)),
Employee attributes: employee id (key), name, pay type (hourly, salary, commission), pay amount, address, tenure, phone number, department
Department attributes: type (management, admin / human resources / sales / auto repair / financing) (key)
Vehicle attributes: make, model, year, vin (key), trim, damage, title status, pay type (financing, sold outright, lease), price, previous ownership, mileage, maintenance history, isReadyToPurchase (boolean), 
Customer attributes: id (key), name, previous purchases, credit score, address, phone number, 
Customer driving vehicle attributes: payment type (bought, lease (if lease time remaining), financing) remaining balance
5. Additional Notes (Optional)
If there are any additional details, assumptions, or considerations that you believe are important for understanding your project, include them here. This section is optional but can provide valuable context.
We are assuming this is a single location car dealership
We are not accounting for repos, returns, theft, natural disaster, fraud, or any other extraordinary circumstances
we may add photo(s) attribute to each vehicle 
Submission Instructions: Save your document as a PDF named as follows: 

Group5_Proposal_CS355.pdf. Submit the PDF through the course's Canvas by the due date.
