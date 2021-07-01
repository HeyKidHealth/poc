mkdir $HOME/docker-neo4j

# 4.1.3 Enterprise
docker run \
    --name=neo4j \
    --publish=7474:7474 --publish=7687:7687 \
    --volume=$HOME/docker-neo4j/neo4j/data/:/data \
    --volume=$HOME/docker-neo4j/neo4j/logs/:/logs \
    --volume=$HOME/docker-neo4j/neo4j/conf/:/conf \
    --volume=$HOME/docker-neo4j/neo4j/plugins/:/plugins \
    --volume=$HOME/docker-neo4j/neo4j/import/:/import \
    --env NEO4J_dbms_memory_pagecache_size=512m \
    --env=NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    --detach \
    neo4j:4.1.3-enterprise

# 4.0.2 Enterprise
docker run \
    --name=neo4j \
    --publish=7474:7474 --publish=7687:7687 \
    --volume=$HOME/docker-neo4j/neo4j/data/:/data \
    --volume=$HOME/docker-neo4j/neo4j/logs/:/logs \
    --volume=$HOME/docker-neo4j/neo4j/conf/:/conf \
    --volume=$HOME/docker-neo4j/neo4j/plugins/:/plugins \
    --volume=$HOME/docker-neo4j/neo4j/import/:/import \
    --env NEO4J_dbms_memory_pagecache_size=512m \
    --env=NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    --detach \
    neo4j:4.0.2-enterprise

docker start neo4j