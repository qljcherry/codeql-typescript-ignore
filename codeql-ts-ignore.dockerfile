FROM node:lts

RUN curl -sLk https://github.com/github/codeql-action/releases/download/codeql-bundle-20211025/codeql-bundle-linux64.tar.gz -o /tmp/codeql-bundle-linux64.tar.gz && \
    mkdir -p /codeql && \
    mkdir -p /codeqlanalysis && \
    tar -xvzf /tmp/codeql-bundle-linux64.tar.gz -C /codeql && \
    rm -f /tmp/codeql-bundle-linux64.tar.gz

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
WORKDIR /project
COPY . .

RUN /codeql/codeql/codeql database create /codeqlanalysis/db --db-cluster --source-root=. --language=javascript --codescanning-config=.codeql.yaml
RUN /codeql/codeql/codeql database analyze /codeqlanalysis/db/javascript javascript-code-scanning --threads=2 --ram=1000 --format=csv --output=/codeqlanalysis/db/javascript.csv
RUN cat /codeqlanalysis/db/javascript.csv