-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cm.cf_id, 
	   cm.buckers_count
INTO backers_total
FROM campaign as cm
WHERE (outcome = 'live')
GROUP BY cf_id
ORDER BY cm.buckers_count DESC;

SELECT * FROM backers_total; 


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
-- Check the backers table
SELECT * FROM backers; 

SELECT cf_id, COUNT(backer_id) AS count_backers
INTO backers_total_backers
FROM backers
GROUP BY cf_id
ORDER BY count_backers DESC;

-- Check the backers_total_backers table
SELECT * FROM backers_total_backers;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT ct.first_name,
	   ct.last_name,
	   ct.email,
	  (cm.goal - cm.pledged) AS "remaining_goal_amount"
INTO email_contacts_remaining_goal_amount
FROM campaign AS cm
LEFT JOIN contacts AS ct
ON cm.contact_id = ct.contact_id
WHERE (cm.outcome = 'live')
ORDER BY "remaining_goal_amount" DESC;


-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT bk.email,
	   bk.first_name,
	   bk.last_name,
	   cm.cf_id,
	   cm.company_name,
	   cm.description,
	   cm.end_date,
	(cm.goal - cm.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers AS bk
LEFT JOIN campaign AS cm
ON cm.cf_id = bk.cf_id
WHERE (cm.outcome = 'live')
ORDER BY bk.last_name, bk.email ASC;

-- HAD to change the ORDER BY statement to match up with given table

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

