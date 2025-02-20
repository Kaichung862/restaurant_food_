-- MySQL Script generated by MySQL Workbench
-- Wed Feb 12 18:00:14 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant` (
  `rest_id` VARCHAR(45) NOT NULL,
  `rest_rating` INT NULL,
  `rest_payroll` DECIMAL(10,2) NULL,
  `rest_name` VARCHAR(45) NULL,
  `rest_city` VARCHAR(45) NULL,
  `rest_state` VARCHAR(45) NULL,
  `rest_traffic` INT NULL,
  PRIMARY KEY (`rest_id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `food` (
  `food_id` VARCHAR(45) NOT NULL,
  `food_gluten_free` ENUM('yes', 'no') NULL,
  `food_calorie_count` INT NULL,
  `food_type` VARCHAR(45) NULL,
  `food_rating` INT NULL,
  `food_cost` DECIMAL(10,2) NULL,
  PRIMARY KEY (`food_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `order_food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `order_food` (
  `order_id` VARCHAR(45) NOT NULL,
  `order_qty` INT NULL,
  `order_date` DATE NULL,
  `food_food_id` VARCHAR(45) NOT NULL,
  `restaurant_rest_id` VARCHAR(45) NOT NULL,
  `order_total` DECIMAL(4,2) NULL,
  PRIMARY KEY (`order_id`, `restaurant_rest_id`),
  INDEX `fk_menu_food_idx` (`food_food_id` ASC) VISIBLE,
  INDEX `fk_menu_restaurant1_idx` (`restaurant_rest_id` ASC) VISIBLE,
  CONSTRAINT `fk_menu_food`
    FOREIGN KEY (`food_food_id`)
    REFERENCES `food` (`food_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_restaurant1`
    FOREIGN KEY (`restaurant_rest_id`)
    REFERENCES `restaurant` (`rest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


use ha_group5_crn71552;

INSERT INTO restaurant (rest_id, rest_rating, rest_payroll, rest_name, rest_city, rest_state, rest_traffic)
VALUES
('R001', 4, 50000.00, 'Gourmet Bites', 'New York', 'NY', 150),
('R002', 5, 75000.00, 'Fine Dine', 'Los Angeles', 'CA', 200),
('R003', 3, 30000.00, 'Quick Bites', 'Chicago', 'IL', 180),
('R004', 4, 45000.00, 'Tasty Treats', 'Houston', 'TX', 170),
('R005', 5, 85000.00, 'Luxury Feast', 'Miami', 'FL', 220),
('R006', 2, 20000.00, 'Budget Eats', 'Boston', 'MA', 120),
('R007', 4, 60000.00, 'Urban Cafe', 'Seattle', 'WA', 160),
('R008', 3, 35000.00, 'Classic Diner', 'Denver', 'CO', 140),
('R009', 5, 90000.00, 'Chef’s Special', 'San Francisco', 'CA', 210),
('R010', 3, 25000.00, 'Fast & Fresh', 'Austin', 'TX', 130);

INSERT INTO food (food_id, food_gluten_free, food_calorie_count, food_type, food_rating, food_cost)
VALUES
('F001', 'yes', 300, 'Salad', 4, 10.50),
('F002', 'no', 700, 'Burger', 5, 15.00),
('F003', 'yes', 450, 'Pasta', 4, 12.75),
('F004', 'no', 600, 'Pizza', 5, 18.25),
('F005', 'yes', 250, 'Soup', 3, 8.50),
('F006', 'no', 900, 'Steak', 5, 30.00),
('F007', 'yes', 400, 'Sushi', 4, 22.00),
('F008', 'no', 800, 'Fried Chicken', 3, 12.50),
('F009', 'yes', 350, 'Vegetable Stir Fry', 4, 11.25),
('F010', 'no', 750, 'Pancakes', 3, 9.75);



INSERT INTO order_food (order_id, order_qty, order_date, food_food_id, restaurant_rest_id, order_total)
VALUES
('O001', 2, '2025-01-15', 'F001', 'R001', 21.00),
('O002', 1, '2025-01-16', 'F002', 'R002', 15.00),
('O003', 3, '2025-01-17', 'F003', 'R003', 38.25),
('O004', 2, '2025-01-18', 'F004', 'R004', 36.50),
('O005', 4, '2025-01-19', 'F005', 'R005', 34.00),
('O006', 1, '2025-01-20', 'F006', 'R006', 30.00),
('O007', 2, '2025-01-21', 'F007', 'R007', 44.00),
('O008', 3, '2025-01-22', 'F008', 'R008', 37.50),
('O009', 2, '2025-01-23', 'F009', 'R009', 22.50),
('O010', 1, '2025-01-24', 'F010', 'R010', 9.75);

# Start queries here 

-- 1) name all of the restaurants and their states.

select rest_name, rest_state
      from restaurant;

-- 2) display the name o
