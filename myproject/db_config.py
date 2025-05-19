import mysql.connector
from mysql.connector import Error
from config import ConfigManager

def create_connection():
    # Retrieve batch size from ConfigManagergi
    config_manager = ConfigManager()
    try:
        connection = mysql.connector.connect(
            host=config_manager.host,
            user=config_manager.user,
            password=config_manager.password, 
            database=config_manager.database
            
        )
        # if connection.is_connected():
        #     print("Connection to MySQL successful")
        return connection
    except Error as e:
        print(f"Error: {e}")
        return None

# Example usage
connection = create_connection()

if connection:
    # Close the connection when done
    print ("Connection Success")
    connection.close()
