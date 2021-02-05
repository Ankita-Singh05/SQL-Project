# SQL-Project

Fitness Project 


# Section I: Business Problem


## As- Is Entity Relationship Diagram 



# Section II: IT-Based Solution Development

## Conceptual Database Design (To-Be ERD)

Cancellation service will support the 5 C’s in the following ways:
•	Capture: For the cancellation service to function effectively and improve the business, the Lifetime Fitness gym must obtain more feedback-based information from 
the gym members. Customers will be requested for their inputs/feedback when discontinuing the gym membership. The preferred rate and membership plan will be captured 
to suggest the customer a new rate: If the customer is canceling the service due to the high rates; If the cancellation is due to dissatisfaction, the reason for 
dissatisfaction will be captured, and if the customer is moving to another location, the new location name and zip code information will be gathered from the customer. 
The database design will be optimized to support customer's inputs from mobile, PC, and tablets. Apart from the cancellation-related information, gym members' 
personal details, membership plan, reservations, trainer allocated for their workout sessions, and time spent in the gym will be captured to supplement the 
information gathered from the cancellation service.
  
•	Convey: The addition of a membership cancellation service will convey to the customers the available membership rates and, in some cases, give a discounted 
rate to avoid churning. Feedback (dissatisfaction message) from customers will pass on the information about business operations that the management team needs to 
focus on (Gym equipment, trainer skills). Cancellation due to relocation will let the customers know about the gym's location near their moving place.
It will also provide business owners with accurate data to analyze and plan strategies to acquire new customers.
  
•	Create: The proposed database design will allow the customers to cancel their services online in three steps if they wish to without any in-person formalities. 
The customer’s membership plan will be upgraded/downgraded based on their preference in membership rates. A dissatisfied customer can send a note to the manager and 
get a response from them through email or choose to speak to them. Membership will be transferred to the new location if the customer accepts to transfer membership.
The new system will create three new relations/tables:  Rate chart (includes discounted rate), Transfer to update the new location of the customer and to provide
continued service, Manager to allow customers to get in touch with the management team which was otherwise not feasible. The cancellation process collects data that 
will help in expanding business and analyzing customer expectations.

•	Cradle: All the data related to the cancellation of membership due to rates, dissatisfaction, and relocation captured from smartphones, PCs, and tablets will be 
stored as a distributed database for analysis and access from different locations and transmitted to a proprietary database system maintained by Lifetime Fitness.

•	Communicate: One of the main issues with the as-is system was that customers could not communicate their reason for cancellation to the gym management. 
In the to-be system, this is mitigated by establishing quick and meaningful communication between the customer and the manager. The customer will now share 
their concerns or reason for dissatisfaction directly with the gym managers. The new system will also allow the customer to provide their preferred rates that
will help the finance team update the membership plan to suit customers' needs. There will be a clear communication of the customer's reason for discontinuing 
the gym membership. The cancellation data can be used for business analysis and churn rate analysis from the database design view. The customer's communication 
about the relocation can also help business owners and sponsors analyze the location trends (business strategies).

# Business Rules
The business rules for Lifetime fitness gym is centered around gym members. A Customer should sign up for a membership to become a member of a gym. 
There are two different types of membership: Gym membership and Spa membership. Customers can choose to sign up for one or both types of membership. 
One (or) many members can be part of a membership plan. A member may or may not make a reservation for the workout sessions. But, members can make 
multiple reservations for different dates and their preference for a workout session. Each reservation should be linked to a single member. A workout 
session conducted by one or many trainers can have many or no reservations. Each trainer is assigned to only one workout session. The workout type could be held in groups or
individually. Members can join only one workout session at a time. 
Members can now cancel through the online portal. Gym members may (or) may not choose to cancel their membership. Each cancellation is mapped to a single member,
and every cancellation should have a member linked to it. There can be three different reasons for cancellation: Rate, Dissatisfaction, and relocation.
After selecting the reason, the customer may decide to cancel or continue with the membership. If the cancellation is due to the rate, members could choose the 
revised chart rates. A rate chart will be offered for all the cancellations that are due to issues with membership rates. If the reason for cancellation is 
dissatisfaction, then the member can choose to send a message to the manager, and the manager has to respond to the members for all their queries/concerns. 
If the member cancels the membership because of relocation, the member could check if the new fitness gym is available in the new location and choose to 
transfer it to the moving place. Each transfer will be associated with a location, and if the location is not available, membership will be canceled. 

# The ‘To-Be’ ERD is color-coded as follows - 
•	The yellow tables are newly designed for the ‘to-be’ system.
•	The white table is part of the ‘as-is’ system. 
•	Grey table is an associate entity for Member and Workout Session. 
•	The associate attribute text in one to one relationship (with optionality) is highlighted in red.




# Section III: Database Implementation (Refere Section 3 Document)








