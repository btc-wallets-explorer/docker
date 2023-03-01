docker build . -t btc-wallets-explorer

The docker image expects the following two files to exist:
- /settings.json
- /wallets.json

docker run -v ./path/to/wallets.json:/wallets.json ./path/to/settings.json:/settings.json --publish 8080:8080 --init btc-wallets-explorer

Then open: http://localhost:8080/
