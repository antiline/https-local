grep -q "127.0.0.1 a.com" /etc/hosts || echo "\n127.0.0.1 a.com" | sudo tee -a /etc/hosts
