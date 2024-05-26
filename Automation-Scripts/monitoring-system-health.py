import psutil
import smtplib
from email.mime.text import MIMEText

CPU_THRESHOLD = 80.0
MEMORY_THRESHOLD = 80.0
EMAIL_FROM = 'your_email@example.com'
EMAIL_TO = 'alert_recipient@example.com'
SMTP_SERVER = 'smtp.example.com'
SMTP_PORT = 587
SMTP_USER = 'your_smtp_user'
SMTP_PASSWORD = 'your_smtp_password'

def send_alert(subject, message):
    msg = MIMEText(message)
    msg['Subject'] = subject
    msg['From'] = EMAIL_FROM
    msg['To'] = EMAIL_TO

    with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
        server.starttls()
        server.login(SMTP_USER, SMTP_PASSWORD)
        server.sendmail(EMAIL_FROM, EMAIL_TO, msg.as_string())

def check_system_health():
    cpu_usage = psutil.cpu_percent(interval=1)
    memory_usage = psutil.virtual_memory().percent

    if cpu_usage > CPU_THRESHOLD:
        send_alert('High CPU Usage Alert', f'CPU usage is at {cpu_usage}%')

    if memory_usage > MEMORY_THRESHOLD:
        send_alert('High Memory Usage Alert', f'Memory usage is at {memory_usage}%')

if __name__ == "__main__":
    check_system_health()
