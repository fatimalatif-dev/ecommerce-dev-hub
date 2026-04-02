# ShopingKaro

ShopingKaro is a web application developed in Node.js that allows users to easily browse and shop for various products. With a user-friendly interface and a variety of features, ShopingKaro aims to provide a seamless online shopping experience.

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Docker Setup](#docker-setup)


## Features

- **User-friendly Interface:** Intuitive design for easy navigation and a pleasant user experience.
- **Product Browsing:** Browse through a wide range of products conveniently categorized for quick access.
- **Cart Management:** Add and remove items from the shopping cart with real-time updates.
- **Responsive Design:** ShopingKaro is optimized for various devices, ensuring a seamless experience on desktops, tablets, and mobile phones.

## Tech Stack

- **JavaScript (45.0%):** The primary programming language used for the functionality and interactivity of ShopingKaro.
- **EJS (31.8%):** Embedded JavaScript templates for dynamic content rendering.
- **CSS (12.5%):** Styling to enhance the visual appeal and user interface.
- **HTML (5.6%):** The backbone for structuring the web pages.
- **Pug (5.1%):** A templating engine for concise and readable HTML code.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/ShopingKaro.git

2. Install dependency:

   ```bash
   npm install

3. Setup MongoDB

   - Go to .env file
   - Create a database in MongoDB
   - Add a user and password in `<yourDBUser>:<password>` in the connection string.

   ```
   mongodb+srv://<yourDBUser>:<password>@<yourDBcluster>/?retryWrites=true&w=majority
   ```

4. Run:

   ```bash
   npm run start

Open your browser and visit http://localhost:3000 to access ShopingKaro.

## Docker Setup

### Local Development with Docker Compose

ShopingKaro includes a `docker-compose.yaml` for local development with Node.js and MongoDB services:

```bash
docker-compose up
```

This starts both the Node.js application and MongoDB containers for seamless local development.

### Production Docker Image

The application is containerized using a Dockerfile for production deployments. The DocumentDB certificate is injected into the Docker image during the build process to enable secure connections to the AWS DocumentDB database.

