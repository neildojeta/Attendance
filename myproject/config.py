import os
from dotenv import load_dotenv

# load_dotenv()

class ConfigManager:
    def __init__(self):
        load_dotenv(dotenv_path='conf/.env')
        # Database Configuration
        self.host = os.getenv('host')
        self.user = os.getenv('user')
        self.password = os.getenv('password')
        self.database = os.getenv('database')

config_manager = ConfigManager()

# Print values outside the class
# print(f"Host: {config_manager.host1}")
# print(f"User: {config_manager.user}")
# print(f"Password: {config_manager.password}")
# print(f"Database: {config_manager.database}")

