This is an SQLITE Database File of a Brazilian E-commerce website

Read more about the Data Source here :-
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
https://www.kaggle.com/datasets/olistbr/marketing-funnel-olist

The relationship between the tables in the database is provided in the image below.
![download](https://github.com/user-attachments/assets/c9ae9eac-1e07-46fc-bb3d-a7401f327c1a)


I used SQL to query the dataset which involved data cleaning and providing major insights.

Here are my "KEY TAKEAWAYS"
* Most of the duplicate values are found in the "geolocation" table

* Most of the null values were found in the "products", "orders", "order_reviews", "leads_closed" and "leads_qualified"

* Most of the city columns in the customers, sellers and geolocation table were filled with special characters á, é, í, ó, ú, â, ê, ô, ã, õ, à, and ç which was substituted for english alphabets while cleaning. Some cities also contain state name abbrevations which was removed as well.


* The top 5 customer's state with the most orders are
    - SP (41746)
    - RJ (12852)
    - MG (11635)
    - RS (5466)
    - PR (5045)



* The top 5 customer's state with the least orders are
    - RR (46)
    - AP (68)
    - AC (81)
    - AM (148)
    - RO (253)


* The top 10 customer cities with the most orders are
    - sao paulo (15540)
    - rio de Janeiro (6882)
    - belo horizonte (2773)
    - brasilia (2131)
    - curitiba (1521)
    - campinas (1444)
    - porto alegre (1379)
    - salvador (1245)
    - guarulhos (1189)
    - sao bernardo do campo (938)
      


 * The customer cities with the least orders 
    - Out of 4113 cities, customers from 4091 cities has less than 500 orders.


  
 * The top 5 landing page's ID that attracts potential visitor sellers are
     - b76ef37428e6799c421989521c0e5077 (912 visits)
     - 22c29808c4f815213303f8933030604c (883 visits)
     - 58326e62183c14b0c03085c33b9fdc44 (495 visits)
     - 88740e65d5d6b056e0cda098e1ea6313 (445 visits)
     - ce1a65abd0973638f1c887a6efcfa82d (394 visits)


  
 * The landing page's ID that attracts least potential visitor sellers
     - 247 landing pages have only one visit.


  
 * Source of Visits to landing pages
     - Sellers from organic_search, paid_search, social and unknown source constitutes to
       over half of potential visitor sellers



  * The potential Visitor Seller's visit per year is
      - 2017 (2002 visits)
      - 2018 (5998 visits)



  * The Closed Seller's visit source are
      - organic_search (271)
      - paid_search (195)
      - unknown (179)
      - social (75)
      - direct_traffic (56)
      - referral (24)
      - email (15)
      - unknown_origin (14)
      - display (6)


   
  * June and December 2017 has significant low visits from potential sellers.


    
  * There are 842 closed sellers from the landing page (qualified)



  * Only 380 sellers out were registered from the 842 closed (in the sellers table).


    
  * 22 sales representative handled all 842 closed sellers, 18 were able to convince 380
    to register, while 4 couldn't. The 4 sales representative id's are
      - 0a0fb2b07d841f84fb6714e35c723075
      - 9749123c950bf8363ace42cb1c2d0815
      - b90f87164b5f8c2cfa5c8572834dbe3f
      - 6aa3b86a83d784b05f0e37e26b20860d


   
  * Most of the orders whose approval is less than 6 days were delivered successfully.


    
  * There were 99441 distinct orders, 96478 were delivered successfully and 2963 weren't.



  * There was a huge spike of orders in november 2017, this may be due to the fact that
    peopole are preparing for christmas season, which is a month ahead, the largest order
    came in on november 24th (1176 orders).



  * The top 10 category where items/products were delivered successfully are
      - bed_bath_table (10953)
      - health_beauty (9465)
      - sports_leisure (8431)
      - furniture_decor (8160)
      - computers_accessories (7644)
      - housewares (6795)
      - watches_gifts (5859)
      - telephony (4430)
      - garden_tools (4268)
      - auto (4140)



  * The least 10 category where items/products were delivered successfully are
      - security_and_services (2)
      - fashion_childrens_clothes (7)
      - cds_dvds_musicals (14),
      - la_cuisine (14)
      - arts_and_craftmanship (24)
      - fashion_sport (29)
      - home_comfort_2 (30)
      - flowers (33)
      - diapers_and_hygiene (37)
      - furniture_mattress_and_upholstery (37)


   
  * Out of 74 product category, 1 category is unknown, 2 (pc_gamer and
    portateis_cozinha_e_preparadores_de_alimentos) has no english translated name, and 71
    categories are properly named. This means 3 categories has no english translaltion.



  * The top 5 most expensive product category by price and freight value are
      - health_beauty (1441248.07)
      - watches_gifts (1305541.61)
      - bed_bath_table (1241681.72)
      - sports_leisure (1156656.48)
      - computers_accessories (1059272.4)



  * The least 5 product category by price and freight value are
      - security_and_services (324.51)
      - fashion_childrens_clothes (665.36)
      - cds_dvds_musicals (954.99)
      - home_comfort_2 (1170.58)
      - flowers (1598.91)


    
  * The least expensive item in all categories is
      - prodcut_id (adc48fd26eea311ca6856b58dfc3ca21), housewares category
        price (6.08)



  * The most expensive item in all categories is
      - prodcut_id (489ae2aa008f021502940f251d4cce7f), housewares category
        price (6929.31)


    
  * The Top 10 most amount spent per category where orders were delvered successfully are
      - health_beauty (1412089.53)
      - watches_gifts (1264333.12)
      - bed_bath_table (1225209.26)
      - sports_leisure (1118256.91)
      - computers_accessories (1032723.77)
      - furniture_decor (880329.92)
      - housewares (758392.25)
      - cool_stuff (691680.89)
      - auto (669454.75)
      - garden_tools (567145.68)



  * The Top 10 least amount spent per category where orders were delvered successfully are
      - security_and_services (324.51)
      - fashion_childrens_clothes (598.67)
      - cds_dvds_musicals (954.99)
      - home_comfort_2 (1170.58)
      - unknown_category (1430.1)
      - flowers (1598.91)
      - diapers_and_hygiene (2046.19)
      - arts_and_craftmanship (2184.14)
      - la_cuisine (2388.54)
      - fashion_sport (2657.55)


   
  * No customer placed more than one order.



  * The most used payment methods are as follows
      - credit_card (74586) is the most used
      - followed by	boleto (19191)
      - voucher (5493) and
      - debit_card (1486)


   
  * For all the 72 product category delivered, they all have positive reviews greater
    than their negative reviews except for security_and_services category, which has 1
    positive review and also only one negative review.
    2 categories (cds_dvds_musicals and fashion_childrens_clothes) has no negative review.




LIMITATIONS - I COULD NOT CREATE STORED PROCEDURES AND FUCTIONS BECAUSE IT IS AN SQLITE FILE.

CONCLUSION - WHEN SELLERS AND BUYERS ARE REGISTERING, THERE SHOULD BE A DROP-DOWN SECTION FOR SELECTING CITIES, THEY CAN CHOOSE CITIES BASED ON THIER LOCATION OR LOCATION CLOSEST TO THEM. THIS WOULD LIMIT DATA REDUNDANCY. THE PRODUCT NAME CATEGORY SHOULD ALSO HAVE THIS DROP-DOWN SECTION AS WELL, THERE SHOULD BE AN UNKNOWN CATEGORY TO SAVE PRODUCTS THAT CAN'T BE DESCRIBED IF NEED BE. 

    


     
    























