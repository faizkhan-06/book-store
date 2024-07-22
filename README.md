# Book Store Project

## Overview

The Book Store Project is a web application developed using Servlet, JSP (JavaServer Pages), and Hibernate. It provides a platform for users to browse, search, and purchase books online. The application features user authentication, a shopping cart, and an administrative interface for managing book inventory.

## Technologies Used

- **Servlet**: For handling HTTP requests and responses.
- **JSP**: For rendering dynamic content on the web pages.
- **Hibernate**: For ORM (Object-Relational Mapping) and database interactions.
- **MySQL**: As the database management system.
- **Maven**: For project management and dependency management.
- **Tomcat**: As the web server for deploying the application.

## Features

- User authentication (login and registration).
- Browse and search for books.
- Add books to the shopping cart.
- Place orders and checkout.
- Administrative interface for managing books (add, edit, delete).
- View order history.

## Setup Instructions

1. **Clone the repository:**
   ```sh
   git clone https://github.com/faizkhan-06/book-store.git
   
2. **Navigate to the project directory:**
   ```sh
   cd book-store
   
3. **Configure the database:**
   - Create a MySQL database named `bookstore`.
   - Update the Hibernate configuration file (`src/main/resources/hibernate.cfg.xml`) with your database credentials.

4. **Build the project using Maven:**
   ```sh
   mvn clean install
   
5. **Deploy the application on Tomcat:**
   - Copy the generated WAR file from the `target` directory to the Tomcat `webapps` directory.
   - Start the Tomcat server.

6. **Access the application:**
   - Open a web browser and go to `http://localhost:8080/book-store`.

## Contributing

Contributions are welcome! Please create a pull request or open an issue to discuss any changes.

