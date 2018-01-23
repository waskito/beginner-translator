Beginner's Translator App


# Pre-installed deps
- docker

# How to run
- `docker build -t beginner-translator .`
- If no network created: `docker network create net-a`
- `docker run -itd -p 9001:9001 -e PORT=9001 --network=net-a -e --name=b-translator beginner-translator`