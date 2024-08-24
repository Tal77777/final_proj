FROM python:3.10-slim

WORKDIR /app

# Upgrade pip and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Check Flask installation
RUN which flask || echo "Flask not found"

# Copy application files
COPY . .

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=3000  # Set the port if needed

# Expose port
EXPOSE 3000

# Command to run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=3000"]
