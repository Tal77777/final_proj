
# Stock News Application

This project is a Flask-based web application that allows users to input a stock symbol and retrieve the latest news related to that stock. The application is built with continuous integration and deployment (CI/CD) in mind, utilizing Jenkins, Terraform, and Docker.

## Features

- **Stock News Retrieval:** Enter a stock symbol to receive the latest news about that stock.
- **Important Keywords Highlighting:** A feature from the feature branch that highlights important keywords in the news articles, which could be potential reasons to invest in the stock (like merge/split/patent).
- **Flask Web Framework:** The application is built using the Flask web framework.
- **Continuous Integration and Deployment:** Every commit triggers a Jenkins pipeline that builds and deploys the application.
- **Automated Deployment:** The application is automatically deployed on an EC2 instance, running on port 3000.
- **Docker Integration:** Each main build is containerized and uploaded to a Docker Hub repository.

## Project Structure

- **`app.py`:** The main Flask application file that handles requests and returns the latest stock news.
- **`Dockerfile`:** Defines the environment and instructions to build the Docker image for the application.
- **`Jenkinsfile`:** Contains the pipeline script for Jenkins, automating the build, test, and deployment processes.
- **`terraform/`:** Contains Terraform scripts to provision an EC2 instance and set up Jenkins.
- **`requirements.txt`:** Specifies the dependencies needed to run the application within Docker.

## Connection Instructions

- **Jenkins Dashboard:** http://51.21.127.55:8080/job/MultiA/
- **Application Access:** http://51.21.127.55:3000

## Prerequisites

- **AWS Account:** Required to provision the EC2 instance using Terraform.
- **Jenkins:** Installed and running on an EC2 instance (port 8080).
- **Docker Hub Account:** Needed to store and manage Docker images.

## Git Integration

- **Webhook Trigger:** A webhook trigger has been set up in the GitHub repository to automatically start the Jenkins pipeline on every commit.

## Steps

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Tal77777/final_proj.git
   cd final_proj
   ```

