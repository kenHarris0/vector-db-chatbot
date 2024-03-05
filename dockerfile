# Use a base image with Python 3.9
FROM python:3.9-slim

WORKDIR /app

# Upgrade pip
RUN pip install --upgrade pip

# Copy only the requirements first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

# Expose the port the app runs on
EXPOSE 8501

# Command to run the app
CMD ["streamlit", "run", "your_app.py"]
