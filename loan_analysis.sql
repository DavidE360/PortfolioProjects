-- Goal: Analyze bank loan and customer data to identify top borrowers, overdue loans, and trends across branches.

-- CREATE database
CREATE DATABASE loan_analysis;
USE loan_analysis;

-- Customers table
CREATE TABLE Customertable2 (
loan_id varchar(50),
customer_id varchar(50),
current_loan_amount DECIMAL(12,2),
term varchar(50),
credit_score Int,
home_ownership VARCHAR(50)
);

-- Sample insert into Customertable1 & Customertable2
INSERT INTO Customertable1 (loan_id, customer_id, current_loan_amount, term, credit_score, home_ownership)
VALUES
('DteC', '981165ec-3274-42f5-a3b4-d104041a9ca9', 445412.00, 'Short Term', 709, 'Home Mortgage'),
('4771cc26-131a-45db-b5aa-537ea4ba5342', '2de017a3-2e01-49cb-a581-08169e83be29', 262328.00, 'Short Term', NULL, 'Home Mortgage'),
('4eed4e6a-aa2f-4c91-8651-ce984ee8fb26', '5efb2b2b-bf11-4dfd-a572-3761a2694725', 99999999.00, 'Short Term', 741, 'Own Home'),
('77598f7b-32e7-4e3b-a6e5-06ba0d98fe8a', 'e777faab-98ae-45af-9a86-7ce5b33b1011', 347666.00, 'Long Term', 721, 'Own Home'),
('d4062e70-befa-4995-8643-a0de73938182', '81536ad9-5ccf-4eb8-befb-47a4d608658e', 176220.00, 'Short Term', NULL, 'Rent'),
('89d8cb0c-e5c2-4f54-b056-48a645c543dd', '4ffe99d3-7f2a-44db-afc1-40943f1f9750', 206602.00, 'Short Term', 7290, 'Home Mortgage'),
('273581de-85d8-4332-81a5-19b04ce68666', '90a75dde-34d5-419c-90dc-1e58b04b3e35', 217646.00, 'Short Term', 730, 'Home Mortgage'),
('db0dc6e1-77ee-4826-acca-772f9039e1c7', '018973c9-e316-4956-b363-67e134fb0931', 648714.00, 'Long Term', NULL, 'Home Mortgage'),
('8af915d9-9e91-44a0-b5a2-564a45c12089', 'af534dea-d27e-4fd6-9de8-efaa52a78ec0', 548746.00, 'Short Term', 678, 'Rent'),
('0b1c4e3d-bd97-45ce-9622-22732fcdc9a0', '235c4a43-dadf-483d-aa44-9d6d77ae4583', 215952.00, 'Short Term', 739, 'Rent'),
('32c2e48f-1ba8-45e0-a530-9a6622c18d9c', '0de7bcdb-ebf4-4608-ba39-05f083f855b6', 99999999.00, 'Short Term', 728, 'Rent'),
('fa096848-6143-4907-b2cf-852a0b06171c', 'aa0a6a22-a95e-48e0-ba4f-b83456d424e4', 541970.00, 'Short Term', NULL, 'Home Mortgage'),
('403d7235-0284-4bb6-919a-09402fecbf7b', '11581f68-de3c-49d8-80d9-22268ebb323b', 99999999.00, 'Short Term', 740, 'Own Home'),
('01d878ae-efa2-41e2-8159-6c834ff09f47', '900c9191-2c20-4688-af7e-07c59b5d5a24', 99999999.00, 'Short Term', 743, 'Rent'),
('2e841c8f-3dc1-464d-91c1-3d3d51e64c38', '2ac05980-7848-4692-89ae-9321afe650f8', 234124.00, 'Short Term', 727, 'Rent'),
('7cbaa3fa-16fd-4343-9bcb-e90b34a1072f', '3ec886e7-f15d-4c35-83d0-bdec4817ae4b', 449020.00, 'Long Term', NULL, 'Own Home'),
('c9a16a9d-8801-4430-b445-dbf9cf845e31', 'abb4c446-08ea-49ff-aeb8-5e1e9da673e7', 653004.00, 'Long Term', NULL, 'Home Mortgage'),
('24e8c8bd-d10b-4dac-8b81-1da470ff5ecb', '967e8733-7189-49b7-a3ab-6a1d0e1abdac', 666204.00, 'Long Term', 723, 'Home Mortgage'),
('c6be21f0-80b1-46b3-8019-16646fd2137d', 'c67b2cb5-9f91-4bcb-9a03-03d1589c6c1a', 66396.00, 'Short Term', NULL, 'Rent'),
('41f7dd8d-bfdd-43de-859a-2ce215aa4c07', '422f9b72-5041-407c-8ac4-982213deacd1', 390390.00, 'Short Term', 747, 'Home Mortgage'),
('150ebbad-ebed-441e-b70d-2f350ad7dca6', '40f729c9-54c7-4768-9fb5-2fa41d074c48', 317108.00, 'Long Term', 687, 'Rent'),
('31ae42f6-7e92-46bf-97e9-fa25499162ba', '016c5139-4da2-44ba-a0a6-7b23597526a8', 128238.00, 'Short Term', 750, 'Rent'),
('c7e2b784-016b-4fc4-8fde-623f09126557', '5b53e176-8fc7-48bf-9d78-ceb5aa284f36', 153252.00, 'Short Term', 714, 'Rent'),
('14c61ec2-6349-4d01-ba85-2daebfbf85d6', 'eb166545-76e5-43ae-8c64-3fe5ebb9c729', 91894.00, 'Short Term', 724, 'Home Mortgage');

INSERT INTO Customertable2 (loan_id, customer_id, current_loan_amount, term, credit_score, home_ownership)
VALUES
('DteC', 'ded0b3c3-6bf4-4091-8726-47039f2c1b90', 611314.00, 'Short Term', 747, 'Home Mortgage'),
('6dcc0947-164d-476c-a1de-3ae7283dde0a', '1630e6e3-34e3-461a-8fda-09297d3140c8', 266662.00, 'Short Term', 734, 'Home Mortgage'),
('f7744d01-894b-49c3-8777-fc6431a2cff1', '2c60938b-ad2b-4702-804d-eeca43949c52', 153494.00, 'Short Term', 709, 'Rent'),
('83721ffb-b99a-4a0f-aea5-ef472a138b41', '12116614-2f3c-4d16-ad34-d92883718806', 176242.00, 'Short Term', 727, 'Rent'),
('08f3789f-5714-4b10-929d-e1527ab5e5a3', '39888105-fd5f-4023-860a-30a3e6f5ccb7', 321992.00, 'Short Term', 744, 'Home Mortgage'),
('a4957169-d809-44cc-847b-975400bc8d11', '6878d414-6a22-4712-ae43-9b3f798e463a', 202928.00, 'Short Term', 741, 'Rent'),
('43467302-94fe-494b-b52f-3fd891fea71c', '48113a98-a4a0-4956-b57d-f0ce344826fb', 621786.00, 'Long Term', 733, 'Home Mortgage'),
('930c7cb3-6086-434a-9547-3ed41c181552', '19941661-98e2-4800-93c9-a0e92057c813', 266794.00, 'Long Term', NULL, 'Own Home'),
('0b2f1b66-741e-4e37-a929-99926cdc9e9a', '6a1adeda-079b-49e5-ac7c-91828f2806a0', 202466.00, 'Short Term', 736, 'Rent'),
('d08f3a5e-93df-40e7-bdd8-cba59180bddf', '4080a828-a61a-4f04-a627-397f4319500c', 266288.00, 'Long Term', 683, 'Rent'),
('3102b699-a2d2-4df4-9c33-005dc41e3525', '8116b23d-aad4-436f-9666-e99b28c21b05', 121110.00, 'Short Term', NULL, 'Rent'),
('663ad9a3-4691-4f8c-90c6-75a5f4f0b34f', '8ec9f388-a275-40ee-9edc-82dec9f978c3', 258104.00, 'Short Term', 723, 'Rent'),
('1e277d73-10b5-475f-8538-2a5a09d62c8d', 'db6fb330-9742-4738-a35f-810f9573684c', 161722.00, 'Short Term', 680, 'Rent'),
('79d992b7-0aa7-4059-a10b-3d416809d77e', '3baae7fe-d27a-40af-9289-2b4626c0893f', 753016.00, 'Long Term', NULL, 'Home Mortgage'),
('c3c63911-be01-410b-a20a-85cb9bb83712', '622add56-97b2-4067-88c7-55eafff12017', 444664.00, 'Short Term', NULL, 'Rent'),
('a913063f-af67-4a8d-b663-e83b9085180d', '4f8389cd-2ac7-40f6-a2bc-5c545838953f', 172282.00, 'Short Term', 696, 'Home Mortgage'),
('e326b52a-66a2-4155-925a-91dcefa97c8a', '8c49e3f3-bf36-434d-a518-145c825d9455', 275440.00, 'Short Term', 729, 'Rent'),
('add946a5-20a5-4211-bf22-408525123b1d', '163b8125-8f24-4b8f-ba59-23ea017f5b48', 218834.00, 'Short Term', 742, 'Own Home'),
('cb6f7b00-62e7-4e18-8e73-73e60396e270', 'ce6fc244-b9a8-44b8-95f4-61c41ed5d03b', 99999999.00, 'Short Term', 715, 'Rent'),
('e6246fe9-6b7b-448c-a817-f91b58199e32', 'bcace9c1-a4c0-4d6d-9582-fa2026c3fc0b', 99999999.00, 'Long Term', 715, 'Rent'),
('ebefe6f6-41d6-4903-a694-7e98d69ab755', 'bd73b695-0960-4c46-a723-4a4cc67135eb', 346610.00, 'Short Term', 744, 'Home Mortgage'),
('eda0e007-b2b1-486a-b4ce-58adefd6c0bd', '6518287d-d7df-4cba-8093-4abea80fb718', 99999999.00, 'Short Term', 747, 'Home Mortgage'),
('82bf9406-2a78-4db2-ac3f-05b024cfbb54', '63e691e6-bf28-48fc-9f54-3bc72945a9bb', 219648.00, 'Long Term', 722, 'Home Mortgage'),
('5dfdc862-7427-4cb7-ae6a-a6b8c9f9eae2', '61d66434-3514-4f9f-acb6-0ccdee208265', 334620.00, 'Short Term', 740, 'Home Mortgage');


-- View all data for both Customer tables
SELECT * FROM Customertable1;
SELECT * FROM Customertable2;

-- Counted Total Loans
SELECT COUNT(*) AS total_loans FROM Customertable1;
SELECT COUNT(*) AS total_loans FROM Customertable2;

-- Loan Distibution by term
SELECT term, COUNT(*) AS num_loans, SUM(current_loan_amount) AS total_amount
FROM Customertable1
GROUP By term;

-- Top 5 highest loans
SELECT loan_id, customer_id, current_loan_amount
FROM Customertable1
ORDER BY current_loan_amount DESC
LIMIT 5;

-- Average credit Score
SELECT AVG(credit_score) AS avg_credit_score
FROM Customertable1
WHERE credit_score IS NOT NULL;


-- Loans per Home Ownership
SELECT home_ownership, COUNT(*) AS num_loans, SUM(current_loan_amount) AS total_amount
FROM Customertable1
GROUP BY home_ownership;

-- Combine Tables using INNER JOIN Clause
SELECT cust1.loan_id AS loan1_id, cust1.customer_id, cust1.current_loan_amount AS loan1_amount,
       cust2.loan_id AS loan2_id, cust2.customer_id, cust2.current_loan_amount AS loan2_amount,
       cust1.term
FROM Customertable1 cust1
INNER JOIN Customertable2 cust2
ON cust1.term = cust2.term;

-- Total loan amount per customer
SELECT 
    l.loan_id,
    l.current_loan_amount + c.current_loan_amount AS total_loan_amount
FROM Customertable1 l
INNER JOIN Customertable2 c
ON l.loan_id = c.loan_id;


-- Find Top 10 largest loans
SELECT 
    loan_id,
    current_loan_amount
FROM Customertable1
ORDER BY current_loan_amount DESC
LIMIT 10;

-- Identify Loans with missing credit
SELECT 
    loan_id,
    credit_score
FROM Customertable1
WHERE credit_score IS NULL;

SELECT 
    loan_id,
    credit_score
FROM Customertable2
WHERE credit_score IS NULL;

-- Find Avg crdit score by term
SELECT term, AVG(credit_score) AS avg_credit_score
FROM customertable1
GROUP BY term;

SELECT term, AVG(credit_score) AS avg_credit_score
FROM customertable2
GROUP BY term;

-- Loan distribution by credit score range
SELECT
CASE
 WHEN credit_score >= 750 THEN 'Excellent'
 WHEN credit_score >= 700 THEN 'Good'
 WHEN credit_score >= 700 THEN 'Fair'
 ElSE 'Poor'
 END AS credit_scorerange,
 COUNT(*) AS loan_count,
 AVG(current_loan_amount) AS avg_loan
FROM customertable1
GROUP BY credit_scorerange;

-- Loan distribution by home ownership + term
SELECT home_ownership, term, COUNT(*) AS loan_count, AVG(current_loan_amount) AS avg_loan
FROM customertable1
GROUP BY home_ownership, term
ORDER BY home_ownership, term;

-- Identify highest loan per credit category
SELECT
CASE
 WHEN credit_score >= 750 THEN 'Excellent'
 WHEN credit_score >= 700 THEN 'Good'
 WHEN credit_score >= 700 THEN 'Fair'
 ElSE 'Poor'
 END AS credit_scorerange,
 MAX(current_loan_amount) AS max_loan
FROM customertable1
GROUP BY credit_scorerange;

-- Combine both tables for more data
SELECT term, AVG(credit_score) AS avg_credit_score, SUM(current_loan_amount) AS total_loans
FROM (
    SELECT term, credit_score, current_loan_amount FROM customertable1
    UNION ALL
    SELECT term, credit_score, current_loan_amount FROM customertable2
) AS combined
GROUP BY term;