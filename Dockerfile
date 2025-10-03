# Use Python 3.12 base image
FROM python:3.12.0

# Set working directory inside the container
WORKDIR /app

# Copy requirements file first and install dependencies
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy all project files into the container
COPY . .
COPY data.json /app/data.json

# Command to run FastAPI app with uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
