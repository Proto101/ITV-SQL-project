create database Online_FOS;

use Online_FOS;

create table Customers(
		CustomerID int primary key,
        FirstName varchar(20) not null,
        LastName varchar(20) not null,
        Email varchar(50) not null,
        Phone varchar(10) not null,
        RegistrationDate date);
        
desc Customers;

Insert into Customers values
(1001,'Lindsey','Pittman','Lindsey.Pittman@gmail.com','4225517074','2023-08-14'),
(1002,'Israel','Mckee','Israel.Mckee@gmail.com','6081363765','2023-06-22'),
(1003,'Darell','Foley','Darell.Foley@gmail.com','4258588774','2023-12-28'),
(1004,'Debra','Mccullough','Debra.Mccullough@gmail.com','6004935472','2023-02-10'),
(1005,'Alonzo','Mcintyre','Alonzo.Mcintyre@gmail.com','8273286300','2023-11-02'),
(1006,'Wiley','Fry','Wiley.Fry@gmail.com','4736068777','2023-11-12'),
(1007,'Wally','House','Wally.House@gmail.com','2874478327','2023-04-06'),
(1008,'Bob','Larson','Bob.Larson@gmail.com','8715997120','2023-03-18'),
(1009,'Rebekah','Salazar','Rebekah.Salazar@gmail.com','7807201813','2023-01-19'),
(1010,'Sandy','Burke','Sandy.Burke@gmail.com','7719006124','2023-01-31');

select * from Customers;

create table Restaurants(
		RestaurantID int primary key,
        RestaurantName varchar(50) not null,
        Address varchar(50) not null,
        CuisineType varchar(50) not null);
        
Insert into Restaurants values
(2001,'Star Roadhouse','Senapati Bapat Rd','Persian'),
(2002,'Cobalt Leaf Eatery','Mangaldas Rd','Italian'),
(2003,'The Nomad House','Airport Rd','Lebanese'),
(2004,'Moonshine Bliss Pub','Connaught Rd','German'),
(2005,'Rogue Escape Farmhouse','Nagar Rd','Italian'),
(2006,'The Bee Supper Club','Sakore Nagar Rd','Cuban'),
(2007,'Via Bistro','Koregaon Park Rd','Japanese'),
(2008,'Lofty Stone Café','Bund Garden Rd','Chinese'),
(2009,'Cove Cucina','Apte Rd','Indonesian'),
(2010,'Owl Canteen','B J Road','Colombian');

select * from Restaurants;

Create table MenuItems(
		MenuItemID int primary key,
        RestaurantID int,
        foreign key (RestaurantID) references Restaurants(RestaurantID),
        ItemName varchar (50) not null,
        Price decimal,
        description text);
        
desc MenuItems;

Insert into MenuItems values
(3001,2001,'Ghormeh Sabzi',60,'A flavorful stew, traditionally served with basmati rice'),
(3002,2001,'Fesenjan',35,'Persian Pomegranate and Walnut Chicken Stew'),
(3003,2001,'Joojeh Kabab',54,'Persian Saffron and Yogurt Chicken Kabobs'),
(3004,2002,'Lasagne alla Bolognese',79,'Italian dish consisting of many layers of wide flat pasta, bechamel, bolognese sauce, and cheese'),
(3005,2002,'Fettuccine al Pomodoro',66,'Pasta dish typically prepared with fresh tomatoes, extra virgin olive oil, garlic, basil and salt'),
(3006,2002,'Gnocchi di Patate',15,'Italian pasta made of cooked mashed potatoes, flour and eggs'),
(3007,2003,'Rice Pilaf',31,'Made with fluffy basmati rice and tossed with peas, carrots, warm spices, and aromatics'),
(3008,2003,'Fattoush',86,'Lebanese salad made from toasted pieces of Arabic flat bread combined with mixed greens and other vegetables, such as radishes and tomatoes'),
(3009,2003,'Kafta',18,'Meatball using either beef, chicken or lamb, mixed with herbs, Middle Eastern spices and onions'),
(3010,2004,'Kartoffelpuffer',100,'German potato pancakes'),
(3011,2004,'Schnitzel',77,'A thin, pounded cutlet of meat that is breaded and fried until crispy and golden'),
(3012,2004,'Apfelstrudel',13,'Thin layers of dough with an apple filling of tart apples (typically Granny Smith), sugar, raisins and walnuts, as well as sour cream'),
(3013,2005,'Napoletana Pizza',97,'A basic dough, raw tomatoes, fresh mozzarella cheese, fresh basil, and olive oil'),
(3014,2005,'Spaghetti alla Carbonara',70,'Long thin strands of pasta with bacon and a creamy sauce made from eggs, Parmesan and black pepper'),
(3015,2005,'Polenta',30,'Polenta is soft and creamy, like porridge or mush'),
(3016,2006,'Lechon Asado',71,'Pork marinated in a mojo marinade'),
(3017,2006,'Picadillo',18,'A spicy Latin American dish of ground meat and vegetables '),
(3018,2006,'Arroz con Pollo',63,'Colorful one-pot chicken and rice dish with layers of flavor'),
(3019,2007,'Ramen',48,' Noodle soup that is made up of broth, noodles, and toppings'),
(3020,2007,'Miso Soup',43,'Soup made primarily of miso paste, dashi (broth), and additional ingredients'),
(3021,2007,'Onigiri',26,' Rice ball made from white rice'),
(3022,2008,'Kung Pao Chicken',47,'A stir-fried Chinese dish that consists of cubed chicken in a sweet, spicy, and savory sauce'),
(3023,2008,'Mapo Tofu',84,'Simmered medium-firm silken tofu flavored with fermented bean paste, beef, plenty of red-hot roasted chili oil, and a handful of Sichuan peppercorns'),
(3024,2008,'Wonton Soup',14,'Pork-filled dumplings in seasoned chicken broth'),
(3025,2009,'rendang',52,'Made with meat stewed in coconut milk and spices'),
(3026,2009,'nasi goreng',32,'National dish of Indonesia, fried rice'),
(3027,2009,'Mie Ayam',51,'Dish of yellow wheat noodles with diced chicken and seasonings'),
(3028,2010,'bandeja paisa',76,'Consists of Colombian sausage, beef, rice, red beans, a fried pork rind called chicharrón, an arepa, a plantain, a slice of avocado and a fried egg'),
(3029,2010,'sancocho',11,'A hearty, rustic stew made with a variety of proteins and vegetables'),
(3030,2010,'arepas',89,'A flat round cornmeal cake');

select * from MenuItems;

create table Orders(
		OrderID int primary key,
        CustomerID int,
        foreign key (CustomerID) references Customers(CustomerID),
        RestaurantID int,
        foreign key (RestaurantID) references Restaurants(RestaurantID),
        OrderDate date,
        TotalAmount decimal);
        
desc Orders;

insert into Orders values
(4001,1001,2001,'2023-08-24',640),
(4002,1002,2002,'2023-07-02',459),
(4003,1003,2003,'2024-01-07',724),
(4004,1004,2004,'2023-02-20',876),
(4005,1005,2005,'2023-11-12',434),
(4006,1006,2006,'2023-11-22',724),
(4007,1007,2007,'2023-04-16',798),
(4008,1008,2008,'2023-03-28',379),
(4009,1009,2009,'2023-01-29',1151),
(4010,1010,2010,'2023-02-10',1032);

select * from Orders;

Create table OrderDetails(
		OrderDetailID int primary key,
        OrderID int,
        foreign key (OrderID) references Orders(OrderID),
        MenuItemID int,
        foreign key (MenuItemID) references MenuItems(MenuItemID),
        Quantity int,
        ItemPrice decimal);
        
desc OrderDetails;

Insert into OrderDetails values
(5001,4001,3001,5,60),
(5002,4001,3002,2,35),
(5003,4001,3003,5,54),
(5004,4002,3004,3,79),
(5005,4002,3005,2,66),
(5006,4002,3006,6,15),
(5007,4003,3007,6,31),
(5008,4003,3008,5,86),
(5009,4003,3009,6,18),
(5010,4004,3010,4,100),
(5011,4004,3011,5,77),
(5012,4004,3012,7,13),
(5013,4005,3013,2,97),
(5014,4005,3014,3,70),
(5015,4005,3015,1,30),
(5016,4006,3016,5,71),
(5017,4006,3017,3,18),
(5018,4006,3018,5,63),
(5019,4007,3019,8,48),
(5020,4007,3020,6,43),
(5021,4007,3021,6,26),
(5022,4008,3022,3,47),
(5023,4008,3023,2,84),
(5024,4008,3024,5,14),
(5025,4009,3025,9,52),
(5026,4009,3026,7,32),
(5027,4009,3027,9,51),
(5028,4010,3028,7,76),
(5029,4010,3029,5,11),
(5030,4010,3030,5,89);

select * from OrderDetails;

create table Reviews(
		ReviewID int primary key,
        RestaurantID int,
        foreign key (RestaurantID) references Restaurants(RestaurantID),
        CustomerID int,
        foreign key (CustomerID) references Customers(CustomerID),
        ReviewDate date,
        Rating Decimal,
        Comments text);
        
desc Reviews;

Insert into Reviews values
(6001,2001,1001,'2023-08-25',5,'Oh! My! God! So good! The food was flavorful, savory, and succulent.'),
(6002,2002,1002,'2023-07-03',3,'The food was all right but seriously lacked presentation'),
(6003,2003,1003,'2024-01-08',5,'I stumbled on this undiscovered gem right in our neighboorhood'),
(6004,2004,1004,'2023-02-21',5,'Yumm-o! The waiter was prompt and polite'),
(6005,2005,1005,'2023-11-13',1,'Meh. The whole place was just dirty'),
(6006,2006,1006,'2023-11-23',5,'Yummers! Everything was simply decadent'),
(6007,2007,1007,'2023-04-17',3,'I felt the prices were too high given the quality of the food'),
(6008,2008,1008,'2023-03-29',2,'I had a less than satisfactory experience and will probably not be here again'),
(6009,2009,1009,'2023-01-30',1,'I should not have to pay good money to be served vegetables from a can'),
(6010,2010,1010,'2023-02-11',1,'Everything tasted either microwaved or straight from a can');

select * from Reviews;