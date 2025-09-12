#!/bin/bash

#
sudo apt update -y
sudo apt install -y jq curl 
sudo apt install -y apache2

installation_code=$(echo "$?")

echo "Installation code is $installation_code"

if [ $installation_code -eq 0 ]; then
    echo "Apache2 instalation successfull"
else
    echo "Error: Apache2 installation failed"
    exit 1
fi

echo "Creating index.html in /var/www/html/index.html"

# Assign the entire HTML content to a variable
# Create a simple index.html file with a basic HTML structure
HTML_CONTENT=$(cat << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Simple Web Page</title>
    <style>
        body {
            font-family: sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
            color: #333;
            text-align: center;
        }
        .container {
            padding: 20px;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #4CAF50;
        }
        p {
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hello World!</h1>
        <p>This web page was created by a simple bash script for Apache 2!</p>
    </div>
</body>
</html>
EOF
)

# The content is redirected to /var/www/html/index.html using sudo.
echo  "$HTML_CONTENT" | sudo tee /var/www/html/index.html > /dev/null

# Restarting Apache2 server to ensure new file is serve
sudo systemctl restart apache2