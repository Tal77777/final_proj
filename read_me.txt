# Stock News Application

This project is a Flask-based web application that allows users to input a stock symbol and retrieve the latest news related to that stock. The application is built with continuous integration and deployment in mind, utilizing Jenkins, Terraform, and Docker.

## Features

- **Stock News Retrieval:** Input a stock symbol and receive the latest news about that stock.
- **Flask Web Framework:** The application is built using Flask.
- **Continuous Integration and Deployment:** Every commit triggers a Jenkins pipeline that builds and deploys the application.
- **Automated Deployment:** The application is automatically deployed on an EC2 instance, running on port 3000.
- **Docker Integration:** Each build is containerized and uploaded to a Docker Hub repository.

## Project Structure

- **`app.py`:** The main Flask application file that handles requests and returns the latest stock news.
- **`Dockerfile`:** Defines the environment and instructions to build the Docker image for the application.
- **`Jenkinsfile`:** Contains the pipeline script for Jenkins, automating the build, test, and deployment processes.
- **`terraform`:** Contains Terraform scripts to provision an EC2 instance and set up Jenkins.

## Connection Instructions
http://51.20.63.159:8080/job/MultiA/
http://51.20.63.159:3000


### Prerequisites

- **AWS Account:** To provision the EC2 instance using Terraform.
- **Jenkins:** Installed and running on an EC2 instance (port 8080).
- **Docker Hub Account:** To store and manage Docker images.

### Steps

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Tal77777/final_proj.git
   cd your-repo
